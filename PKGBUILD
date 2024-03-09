pkgname=tty-colorscheme
pkgver=1.0
pkgrel=1
pkgdesc='Change TTY colors'
url=https://github.com/red-magic/tty-colorscheme
arch=(any)
backup=(etc/tty-colorscheme/tty-colorscheme.conf)
install=$pkgname.install
source=($url/archive/refs/tags/v$pkgver.tar.gz)
b2sums=(a33d603ff3cc727d3a26d855fae21a3ddfe491408d9b51a2e5ddc0e8e9af4f5fb2d1ace81fa2851d12a65ad0230137942474d9e5cc3e9e5266703fda7e37f805)

package() {
	install -Dm 755 $pkgname-$pkgver/tty-colorscheme -t $pkgdir/usr/bin
	install -Dm 644 $pkgname-$pkgver/colorschemes/gogh/* -t $pkgdir/etc/tty-colorscheme/colorschemes
	install -Dm 644 $pkgname-$pkgver/colorschemes/extra/* -t $pkgdir/etc/tty-colorscheme/colorschemes
	install -Dm 644 $pkgname-$pkgver/systemd/tty-colorscheme.conf -t $pkgdir/etc/tty-colorscheme
	install -Dm 644 $pkgname-$pkgver/systemd/tty-colorscheme.service -t $pkgdir/usr/lib/systemd/system
}
