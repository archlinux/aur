# Maintainer: invverse <cheery.art2642 at fastmail dot com>
# Contributor: eggix <eggix[at]protonmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua

pkgname=xnec2c
pkgver=4.4.16
pkgrel=1
pkgdesc="GTK+ Antenna EM Modeling Client"
arch=('i686' 'x86_64')
url="https://www.xnec2c.org/"
license=('GPL')
depends=('gtk3')
makedepends=('git')
optdepends=('gnuplot: to use plotted output/data files'
            'lapacke: LAPACK+BLAS support')
provides=('xnec2c')
conflicts=('xnec2c')
_basename=${pkgname%}
source=("$pkgname-$pkgver.tgz::https://github.com/KJ7LNW/xnec2c/archive/v$pkgver.tar.gz")
md5sums=('c2ef600be93e7d9a0484db300bb14957')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./autogen.sh
	./configure --prefix=/usr
	make desktop-install
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
