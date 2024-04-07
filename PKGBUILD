pkgname=tty-colorscheme
pkgver=1.1
pkgrel=1
pkgdesc='A simple script to change colors in the linux TTY with over 300 colorschemes'
url=https://github.com/red-magic/tty-colorscheme
arch=(any)
backup=(etc/tty-colorscheme/tty-colorscheme.conf)
options=(!debug)
install=$pkgname.install
source=(v$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
b2sums=(53ca34a54cce074d0e134ce26670ac864e6ed5f538d3fdc19f23c3e56fafb4baa903e860bf08fc71fe47a6a6bd56b28687e6a641659c9d3832fefe9e18c22ff2)

package() {
	install -Dm 755 $pkgname-$pkgver/tty-colorscheme/tty-colorscheme -t $pkgdir/usr/bin
	install -Dm 644 $pkgname-$pkgver/tty-colorscheme/colorschemes/gogh/* -t $pkgdir/etc/tty-colorscheme/colorschemes
	install -Dm 644 $pkgname-$pkgver/tty-colorscheme/colorschemes/extra/* -t $pkgdir/etc/tty-colorscheme/colorschemes
	install -Dm 644 $pkgname-$pkgver/systemd/tty-colorscheme.conf -t $pkgdir/etc/tty-colorscheme
	install -Dm 644 $pkgname-$pkgver/systemd/tty-colorscheme.service -t $pkgdir/usr/lib/systemd/system
}
