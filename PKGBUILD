# Maintainer: Michael Massoni <hello@michaelmassoni.com>
pkgname=yap-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="A simple, human-readable wrapper for yay"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/michaelmassoni/yap"
license=('GPL3')
depends=('yay')
provides=("yap")
conflicts=("yap")

source_x86_64=("https://github.com/michaelmassoni/yap/releases/download/v${pkgver}/yap_x86_64")
sha256sums_x86_64=('2e33a83b8d8e158500af5be4d197258f35e49c2f896e31553ce8bcd42750596f')

source_aarch64=("https://github.com/michaelmassoni/yap/releases/download/v${pkgver}/yap_aarch64")
sha256sums_aarch64=('7edeace4abb9f6dddd4bfec947198a28856b787d02059bd76f1566e73b68696d')

source_armv7h=("https://github.com/michaelmassoni/yap/releases/download/v${pkgver}/yap_armv7h")
sha256sums_armv7h=('0ae669f4cb7b4eb050ddcdab4089bd07daf203d2d1c72d6fcae32c37a4c142ae')

source=("https://raw.githubusercontent.com/michaelmassoni/yap/main/LICENSE")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
	case "$CARCH" in
		x86_64)  _bin="yap_x86_64" ;;
		aarch64) _bin="yap_aarch64" ;;
		armv7h)  _bin="yap_armv7h" ;;
	esac
	install -Dm755 "${srcdir}/${_bin}" "${pkgdir}/usr/bin/yap"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
