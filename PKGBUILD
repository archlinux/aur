# Maintainer: Your Name <your-email@example.com>
_basename='navcoin'
pkgname='navcoin-bin'
pkgver='7.0.3'
pkgrel='1'
pkgdesc="Privacy-oriented cryptocurrency and distributed computing platform - Official Binaries"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://navcoin.org/"
license=('MIT')
depends=('boost-libs' 'python')
install="${pkgname}.install"
source=("navcoin.desktop" "navcoind.service")
sha256sums=('ed70cd4a416a94ed6145ab23241130896517fca50296c946122df9b8d4e805e9'
            '648b4fa86e7d435814e844a57bf2b29b61a994d7bb4e36cde207e29520f7d9d2')
sha256sums_x86_64=('ba4dffd7bd374eed5bdcc19bb4d25fac09d62ac65d8b56ffc53d30cb1264f21d')
sha256sums_aarch64=('ad241e937a72bc506a0d5ae0291b6a7e3945ed5d2ac2e550ecae10cc79707839')
sha256sums_armv7h=('c115d03e25764d43cffc14dfe899d259089cb542f5b4f705061ac9131bb08ae2')

# Architecture specific sources
source_x86_64=("https://github.com/NAVCoin/navcoin-core/releases/download/${pkgver}/${_basename}-${pkgver}-x86_64-linux-gnu.tar.gz")

source_aarch64=("https://github.com/NAVCoin/navcoin-core/releases/download/${pkgver}/${_basename}-${pkgver}-aarch64-linux-gnu.tar.gz")

source_armv7h=("https://github.com/NAVCoin/navcoin-core/releases/download/${pkgver}/${_basename}-${pkgver}-arm-linux-gnueabihf.tar.gz")

package() {
	cd "${srcdir}/${_basename}-${pkgver}"
	install -Dm755 bin/navcoin-cli "${pkgdir}/usr/bin/navcoin-cli"
	install -Dm755 bin/navcoind "${pkgdir}/usr/bin/navcoind"
	install -Dm755 bin/navcoin-qt "${pkgdir}/usr/bin/navcoin-qt"
	install -Dm755 bin/navcoin-tx "${pkgdir}/usr/bin/navcoin-tx"

	install -Dm644 "${srcdir}/navcoind.service" "${pkgdir}/usr/lib/systemd/system/navcoind.service"
	install -Dm644 "${srcdir}/navcoin.desktop" "${pkgdir}/usr/share/applications/navcoin.desktop"
}
