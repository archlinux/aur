# Maintainer: danitool dgcbueu at gmail.com

pkgname=osd_countdown
pkgver=0.1
pkgrel=1
pkgdesc="A countdown (timer) which uses the X On-Screen Display library"
arch=('i686' 'x86_64')
url="https://github.com/danitool/osd_countdown"
source=("https://github.com/danitool/osd_countdown/archive/${pkgver}.tar.gz")
license=('GPL2')
depends=('xosd' 'gnu-free-fonts')
makedepends=('make')
md5sums=('719ace6496d725a17a993d00d9b8ba3c')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -D -m 755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -D -m 644 "$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
}
