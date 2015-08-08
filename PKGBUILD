# Maintainer: Jeremy Ruten <jeremy.ruten@gmail.com>
# Contributor: Gustavo Lopes <mail@geleia.net>
pkgname=xrandr-invert-colors
pkgver=0.01
pkgrel=1
pkgdesc="Simple utility that inverts colors on all screens, using XrandR."
arch=('i686' 'x86_64')
url="https://github.com/zoltanp/xrandr-invert-colors"
license=('GPL')
depends=(libxau libxdmcp libxcb libxrandr)
source=('https://github.com/zoltanp/xrandr-invert-colors/archive/v0.01.tar.gz')
md5sums=('08224f5b75e3c359acca915782d05b42')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
  install -D -m=755 xrandr-invert-colors.bin \
    "$pkgdir"/usr/bin/xrandr-invert-colors
}
