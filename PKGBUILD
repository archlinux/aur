# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=thomasschafer
_pkgname=scooter
pkgname=${_pkgname}-bin
pkgver=0.8.5
pkgrel=1
pkgdesc="An interactive find and replace in the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-${arch[0]}-unknown-linux-musl.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-${arch[1]}-unknown-linux-musl.tar.gz")
sha256sums=('af818a9cb6e45a1317662644ec51a15b2f2cba198796b7b39db317766d206863'
            'c8bab667b4b12e508a1139fb498dd9ae82e13abbae29d5b0ac86be3185a30980')
sha256sums_x86_64=('53bef1f01507c9743e59d2d6ae326180f313f60ab99ed68e3f7753b1d9aa6f2a')
sha256sums_aarch64=('1b7736552f0c22ef82edfee388d705e0a401a4bb11de69107c907635795f17cc')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
