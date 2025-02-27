pkgname=tty-colorscheme
pkgver=1.6
pkgrel=1
pkgdesc='A simple script to change colors in the linux TTY with over 300 colorschemes'
url=https://github.com/red-magic/tty-colorscheme
arch=(any)
depends=(bash)
backup=(etc/tty-colorscheme/tty-colorscheme.conf)
options=(!debug)
install=$pkgname.install
source=($pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
b2sums=(532a4ec7e362601e255d4c52173e418137664c239a2e11caf50cd6502bee1dc9fe24d39b0a3fe148f260b88e13c7bb090783b43835049c493a66a0844d6e29b6)

package() {
	install -Dm 755 $pkgname-$pkgver/tty-colorscheme/tty-colorscheme -t $pkgdir/usr/bin
	install -Dm 644 $pkgname-$pkgver/tty-colorscheme/colorschemes/*/* -t $pkgdir/etc/tty-colorscheme/colorschemes
	install -Dm 644 $pkgname-$pkgver/tty-colorscheme/tty-colorscheme.conf -t $pkgdir/etc/tty-colorscheme
	install -Dm 644 $pkgname-$pkgver/tty-colorscheme/tty-colorscheme.service -t $pkgdir/usr/lib/systemd/system
	install -Dm 644 $pkgname-$pkgver/tty-colorscheme/tty-colorscheme.1 -t $pkgdir/usr/share/man/man1
}
