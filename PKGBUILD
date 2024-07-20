# Maintainer: Yigid BALABAN <fyb at fybx.dev> 
pkgname=ianny-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Desktop utility that helps preventing repetitive strain injuries by keeping track of usage patterns and periodically informing the user to take breaks."
arch=('x86_64')
url="https://github.com/zefr0x/ianny"
license=('GPL-3.0-only')
depends=(dbus glibc gcc-libs)
makedepends=(cargo meson)
provides=(ianny)
conflicts=(ianny)
source=("$pkgname-$pkgver.tar.gz::https://github.com/zefr0x/${pkgname%-bin}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-$CARCH-unknown-linux-gnu.tar.gz")
sha256sums=('66471dc57709ce0a15a55a502ff184a782a58001606daec8c72b13dc56dfe40f')

package() {
	cd "$CARCH-unknown-linux-gnu"	
	install -Dm0755 -t "$pkgdir/usr/bin/ianny" "usr/local/bin/ianny"
	install -Dm0644 -t "$pkgdir/usr/share" "usr/local/share/applications/io.github.zefr0x.ianny.desktop" "usr/local/share/locale/ar/LC_MESSAGES/io.github.zefr0x.ianny.mo" 
	install -Dm644 -t "$pkgdir/etc/xdg/autostart" "etc/xdg/autostart/io.github.zefr0x.ianny.desktop"
}

