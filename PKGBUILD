# Maintainer: Mohammad Zolfaghari <zidom72@gmail.com>
arch=('x86_64')
pkgdesc="Nordvpn tray icon"
_pkgname="nordtray"
pkgname="${_pkgname}-bin"
license=('custom: public domain')
pkgver=0.1.1
pkgrel=2
depends=('at-spi2-core' 'libappindicator-gtk3' 'nordvpn')
optdepends=("nordtray-executable-symlink-latest: To make 'nordtray' executable available in '/usr/bin'.")
source=("https://github.com/zoli/nordtray/releases/download/${pkgver}/nordtray" "https://github.com/zoli/nordtray/archive/${pkgver}.tar.gz")
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
sha256sums=('68f4c532215df43657fb0226bc064fe5e6e6d04f9c701d44df2fa71afbe0cf96' 'SKIP')
url='https://github.com/zoli/nordtray/'

package() {
	install -D -m644 "$srcdir/$pkgname-$pkgver/assets/nordtray.desktop" "$pkgdir/usr/share/applications/NordTray.desktop"
	install -D -m644 "$srcdir/$pkgname-$pkgver/assets/nord-active.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/NordTray.png"
	install -D -m755 nordtray "$pkgdir/usr/lib/nordtray/nordtray"
}
