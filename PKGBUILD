# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=josephburnett
_pkgname=jd
pkgname=${_pkgname}-bin
pkgver=2.5.0
pkgrel=1
pkgdesc="JSON diff and patch"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-tool")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}::${_urlraw}/README.md"
        "RELEASE_NOTES-${pkgver}::${_urlraw}/RELEASE_NOTES.md")
source_x86_64=("${_pkgname}-${pkgver}-${arch[0]}::${url}/releases/download/v${pkgver}/${_pkgname}-amd64-linux")
source_aarch64=("${_pkgname}-${pkgver}-${arch[1]}::${url}/releases/download/v${pkgver}/${_pkgname}-arm64-linux")
sha256sums=('7db445fe94ae6fb0c5ab69a6b47ec38a0e4b6d5a38f9d1493c0d8cb7c8ad2516'
            'fd36f514bd7413acc2359cc33ed74968d7cd0599a40897bd52d0d33f971f86f6'
            'af5a5978c6ba01bed3d79ab8cec450ebd661444ac1857c97aeb51d54b3bf87a7')
sha256sums_x86_64=('785dbbb8af613269539de952f7444f66f7cfbeb886c037495c4f0b2c3680db27')
sha256sums_aarch64=('3c45a7b95a0fa7e0fd0dbeb65e02a40ba46078d9b27129b3455b8f7f650d3a80')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 "RELEASE_NOTES-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/RELEASE_NOTES.md"
}
