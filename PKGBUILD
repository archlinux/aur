pkgname=tty-colorscheme
pkgver=1.2
pkgrel=1
pkgdesc='A simple script to change colors in the linux TTY with over 300 colorschemes'
url=https://github.com/red-magic/tty-colorscheme
arch=(any)
depends=(bash)
backup=(etc/tty-colorscheme/tty-colorscheme.conf)
options=(!debug)
install=$pkgname.install
source=(v$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
b2sums=(ed361a40eedb4d87b009b3c2e1201edaba0ce70a6a5415ee6c015769c3c843fa0274ed75448df1a1233e7346796e2ae81553a327ddc21def3e313e3d2958141d)

package() {
	install -Dm 755 $pkgname-$pkgver/tty-colorscheme/tty-colorscheme -t $pkgdir/usr/bin
	install -Dm 644 $pkgname-$pkgver/tty-colorscheme/colorschemes/gogh/* -t $pkgdir/etc/tty-colorscheme/colorschemes
	install -Dm 644 $pkgname-$pkgver/tty-colorscheme/colorschemes/extra/* -t $pkgdir/etc/tty-colorscheme/colorschemes
	install -Dm 644 $pkgname-$pkgver/service/tty-colorscheme.conf -t $pkgdir/etc/tty-colorscheme
	install -Dm 644 $pkgname-$pkgver/service/systemd/tty-colorscheme.service -t $pkgdir/usr/lib/systemd/system
	install -Dm 644 $pkgname-$pkgver/man/tty-colorscheme.1 -t $pkgdir/usr/share/man/man1
}
