# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ralsina
_pkgname=crycco
pkgname=${_pkgname}-bin
pkgver=0.5.2
pkgrel=1
pkgdesc="A literate programming tool"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

options=(!strip)

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "CHANGELOG-${pkgver}.md::${_urlraw}/CHANGELOG.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-static-linux-${_barch[0]}")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-static-linux-${_barch[1]}")
sha256sums=('91c5a6fc53adf00971f7b4851ae27b91291e470a67f2474d00c965d05dc7d286'
            'b7e334c1513c7a4a24332179ad3a63043fc2f65d36e71a4a7a01eb8bb9e522d6'
            '300991fb9cf5eb750aac012c2980351b10fe8dc87163b00a213d91c509e9b695')
sha256sums_x86_64=('23d6086a8fff0585ebf10cdbc987527ee6ef7ab832a7168eff9d8f1f78491df1')
sha256sums_aarch64=('92d332ee38c004948c56e48ca47d56abba9e21f9ad3fa4ae09f25dd4eb5dfd02')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-static-linux-"* "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
