pkgname=tty-colorscheme
pkgver=1.13
pkgrel=1
pkgdesc='A simple script to change colors in the linux TTY with over 400 colorschemes'
url=https://github.com/red-magic/tty-colorscheme
arch=(any)
depends=(bash)
backup=(etc/tty-colorscheme/tty-colorscheme.conf)
options=(!debug)
install=$pkgname.install
source=($pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
b2sums=(7bc8de5822894a3dab330c8bda726eb6364beea159a8634e5a668ef31561f921cee86846b54d258d25990fc2cb73b9781830ca0e0270a87a3a9424268482cc49)

package() {
	install -Dm 755 $pkgname-$pkgver/tty-colorscheme/tty-colorscheme -t $pkgdir/usr/bin
	install -Dm 644 $pkgname-$pkgver/tty-colorscheme/colorschemes/*/* -t $pkgdir/etc/tty-colorscheme/colorschemes
	install -Dm 644 $pkgname-$pkgver/tty-colorscheme/tty-colorscheme.conf -t $pkgdir/etc/tty-colorscheme
	install -Dm 644 $pkgname-$pkgver/tty-colorscheme/tty-colorscheme.service -t $pkgdir/usr/lib/systemd/system
	install -Dm 644 $pkgname-$pkgver/tty-colorscheme/tty-colorscheme.1 -t $pkgdir/usr/share/man/man1
}
