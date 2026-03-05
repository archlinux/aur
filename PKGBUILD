# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=dalance
_pkgname=amber
pkgname=${_pkgname}-search-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="A code search and replace tool written in Rust. Inspired by ack, ag, and grep."
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}-search")
conflicts=("${_pkgname}-search")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-${arch[0]}-lnx.zip")
sha256sums=('ff1d92e0d4a51bdd353d8f436dad6d6afe85b684eb9365301cbb76e9c564362f'
            '989fbe0cd6a7062cbd7950b7ce1c413f40810826d48c5fa29ca7fe52088d0e6c')
sha256sums_x86_64=('fcf828a849e601ac20402709ef9f6c4700295a53b6aa90078ff6ca606b27faa9')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "ambs" "${pkgdir}/usr/bin/ambs"
	install -Dm755 "ambr" "${pkgdir}/usr/bin/ambr"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
