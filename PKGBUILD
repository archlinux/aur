pkgname=tty-colorscheme
pkgver=1.3
pkgrel=1
pkgdesc='A simple script to change colors in the linux TTY with over 300 colorschemes'
url=https://github.com/red-magic/tty-colorscheme
arch=(any)
depends=(bash)
backup=(etc/tty-colorscheme/tty-colorscheme.conf)
options=(!debug)
install=$pkgname.install
source=(v$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
b2sums=(9cd5b35a548d78b21add50e56a904b7f97988a5b9c58ffb9c66f2a3d78ff006456027c0f905bd61b715756ee9308995eae5c44447d7775c2aa0a9e13c834f85c)

package() {
	install -Dm 755 $pkgname-$pkgver/tty-colorscheme/tty-colorscheme -t $pkgdir/usr/bin
	install -Dm 644 $pkgname-$pkgver/tty-colorscheme/colorschemes/gogh/* -t $pkgdir/etc/tty-colorscheme/colorschemes
	install -Dm 644 $pkgname-$pkgver/tty-colorscheme/colorschemes/extra/* -t $pkgdir/etc/tty-colorscheme/colorschemes
	install -Dm 644 $pkgname-$pkgver/service/tty-colorscheme.conf -t $pkgdir/etc/tty-colorscheme
	install -Dm 644 $pkgname-$pkgver/service/systemd/tty-colorscheme.service -t $pkgdir/usr/lib/systemd/system
	install -Dm 644 $pkgname-$pkgver/man/tty-colorscheme.1 -t $pkgdir/usr/share/man/man1
}
