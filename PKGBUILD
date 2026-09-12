pkgname=tty-colorscheme
pkgver=1.17
pkgrel=1
pkgdesc='A simple script to change colors in the linux TTY with various colorschemes'
url=https://github.com/red-magic/tty-colorscheme
arch=(any)
depends=(bash)
backup=(etc/tty-colorscheme/tty-colorscheme.conf)
options=(!debug)
install=$pkgname.install
source=($pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
b2sums=(52ac4b6fdf4cc19037fec757376a264e58dd71bf521c4ab8100c574be5ac0e230a822c4a71fa9c9cf03c0cef446c2090f9892b7ceeae4ba1bcd8c8b2b33aa54f)

package() {
	install -Dm 755 $pkgname-$pkgver/tty-colorscheme/tty-colorscheme -t $pkgdir/usr/bin
	install -Dm 644 $pkgname-$pkgver/tty-colorscheme/colorschemes/*/* -t $pkgdir/etc/tty-colorscheme/colorschemes
	install -Dm 644 $pkgname-$pkgver/tty-colorscheme/tty-colorscheme.conf -t $pkgdir/etc/tty-colorscheme
	install -Dm 644 $pkgname-$pkgver/tty-colorscheme/tty-colorscheme.service -t $pkgdir/usr/lib/systemd/system
	install -Dm 644 $pkgname-$pkgver/tty-colorscheme/tty-colorscheme.1 -t $pkgdir/usr/share/man/man1
}
