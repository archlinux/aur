pkgname=tty-colorscheme
pkgver=1.8
pkgrel=1
pkgdesc='A simple script to change colors in the linux TTY with over 400 colorschemes'
url=https://github.com/red-magic/tty-colorscheme
arch=(any)
depends=(bash)
backup=(etc/tty-colorscheme/tty-colorscheme.conf)
options=(!debug)
install=$pkgname.install
source=($pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
b2sums=(b2cdfd21e2e99eb24bdb044f6ab85b93f0cbc3abd9181c265ee993348109be2cec5829f3d20cc29c1b2a56510e3ffaec27bd1ea9c3a717861883c206194f32e3)

package() {
	install -Dm 755 $pkgname-$pkgver/tty-colorscheme/tty-colorscheme -t $pkgdir/usr/bin
	install -Dm 644 $pkgname-$pkgver/tty-colorscheme/colorschemes/*/* -t $pkgdir/etc/tty-colorscheme/colorschemes
	install -Dm 644 $pkgname-$pkgver/tty-colorscheme/tty-colorscheme.conf -t $pkgdir/etc/tty-colorscheme
	install -Dm 644 $pkgname-$pkgver/tty-colorscheme/tty-colorscheme.service -t $pkgdir/usr/lib/systemd/system
	install -Dm 644 $pkgname-$pkgver/tty-colorscheme/tty-colorscheme.1 -t $pkgdir/usr/share/man/man1
}
