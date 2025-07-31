pkgname=tty-colorscheme
pkgver=1.7
pkgrel=1
pkgdesc='A simple script to change colors in the linux TTY with over 400 colorschemes'
url=https://github.com/red-magic/tty-colorscheme
arch=(any)
depends=(bash)
backup=(etc/tty-colorscheme/tty-colorscheme.conf)
options=(!debug)
install=$pkgname.install
source=($pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
b2sums=(5349310ccb8c29b3a91d3d5f2533f601aa14f25296e40070c90755336bc88c3b1f07196d0eabc929059be8dcd5c2f326870df07d50b1cf72542328b4e57ed3e3)

package() {
	install -Dm 755 $pkgname-$pkgver/tty-colorscheme/tty-colorscheme -t $pkgdir/usr/bin
	install -Dm 644 $pkgname-$pkgver/tty-colorscheme/colorschemes/*/* -t $pkgdir/etc/tty-colorscheme/colorschemes
	install -Dm 644 $pkgname-$pkgver/tty-colorscheme/tty-colorscheme.conf -t $pkgdir/etc/tty-colorscheme
	install -Dm 644 $pkgname-$pkgver/tty-colorscheme/tty-colorscheme.service -t $pkgdir/usr/lib/systemd/system
	install -Dm 644 $pkgname-$pkgver/tty-colorscheme/tty-colorscheme.1 -t $pkgdir/usr/share/man/man1
}
