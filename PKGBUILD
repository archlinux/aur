# Maintainer: Elia Nitsche <nitscheelia at gmail.com>
# Contributor: Yigid BALABAN <fyb at fybx.dev>
pkgname=ianny-bin
pkgver=2.1.1
pkgrel=1
pkgdesc="Desktop utility that helps preventing repetitive strain injuries by periodically informing the user to take breaks."
arch=('x86_64')
url="https://github.com/zefr0x/ianny"
license=('GPL-3.0-only')
depends=(dbus glibc gcc-libs)
provides=(ianny)
conflicts=(ianny)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/zefr0x/${pkgname%-bin}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
sha256sums=('2c8cc1dfdfcdc8e642dced18e9980e2ea878129e932c57b3b42a3e4e814e0c73')

package() {
	cd "$CARCH-unknown-linux-gnu"
	
	# install the program
	install -Dm755 "usr/local/bin/ianny" "$pkgdir/usr/bin/ianny"
	# install extra files
	install -Dm644 "usr/local/share/applications/io.github.zefr0x.ianny.desktop" "$pkgdir/usr/share/applications/io.github.zefr0x.ianny.desktop" 
	install -Dm644 "usr/local/share/locale/ar/LC_MESSAGES/io.github.zefr0x.ianny.mo" "$pkgdir/usr/share/locale/ar/LC_MESSAGES/io.github.zefr0x.ianny.desktop"
	# add to autostart
	install -Dm644 "etc/xdg/autostart/io.github.zefr0x.ianny.desktop" "$pkgdir/etc/xdg/autostart/io.github.zefr0x.ianny.desktop"
}
