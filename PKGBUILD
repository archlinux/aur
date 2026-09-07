# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=0xjuanma
_pkgname=helm
pkgname=${_pkgname}-bin
pkgver=0.9.0
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="A minimalistic and customizable pomodoro-like timer for your terminal"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('Apache-2.0')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[1]}")
sha256sums=('4dc0a5daa325b37f64f50f726db4dd94342dcfec49bd0fe80266a0ef59953bfa'
            '788587abbf3572dc93db0647da0dd57e7b143f8afcbe3c03123e869e0a3117c8')
sha256sums_x86_64=('31ef56a6868e9e674d25c211e97555c0374675146522f4b3abc63f8d4d4fe0a9')
sha256sums_aarch64=('bc97075691f29a72e3e66e82fe64fdca3dc9a9299d67cea9be963ac3ab9c5d75')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
