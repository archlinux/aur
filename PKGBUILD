# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=josephburnett
_pkgname=jd
pkgname=${_pkgname}-bin
pkgver=2.3.1
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
            '90c13b6586f4219f4135e399f7bb8bbdc1bf6c379e6c34910cd0e471cb94448b'
            'af5a5978c6ba01bed3d79ab8cec450ebd661444ac1857c97aeb51d54b3bf87a7')
sha256sums_x86_64=('dc052e875333d8a6e0e3d575f2097e6ce78742635a68402c1618205f11464d81')
sha256sums_aarch64=('2786ee1701a79eb34be2a3f6f903a408b3a469f24fb8ce0e36c97b1a0b0b168a')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 "RELEASE_NOTES-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/RELEASE_NOTES.md"
}
