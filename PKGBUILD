pkgname=tty-colorscheme
pkgver=1.4
pkgrel=1
pkgdesc='A simple script to change colors in the linux TTY with over 300 colorschemes'
url=https://github.com/red-magic/tty-colorscheme
arch=(any)
depends=(bash)
backup=(etc/tty-colorscheme/tty-colorscheme.conf)
options=(!debug)
install=$pkgname.install
source=(v$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
b2sums=(3c6ae6e3ad7e5460e46ef5f77ae77d9497eefba51fc7a82620f70ae6529a7a1cf1a942577adab73e88e480720aa3a5b2b22b5ed1c4cff3973854732118943cab)

package() {
	install -Dm 755 $pkgname-$pkgver/tty-colorscheme/tty-colorscheme -t $pkgdir/usr/bin
	install -Dm 644 $pkgname-$pkgver/tty-colorscheme/colorschemes/*/* -t $pkgdir/etc/tty-colorscheme/colorschemes
	install -Dm 644 $pkgname-$pkgver/tty-colorscheme/tty-colorscheme.conf -t $pkgdir/etc/tty-colorscheme
	install -Dm 644 $pkgname-$pkgver/tty-colorscheme/tty-colorscheme.service -t $pkgdir/usr/lib/systemd/system
	install -Dm 644 $pkgname-$pkgver/tty-colorscheme/tty-colorscheme.1 -t $pkgdir/usr/share/man/man1
}
