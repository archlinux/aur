pkgname=bdf-creep
pkgver=0.31.r19.gb03111f
pkgrel=1
arch=('any')
url='https://github.com/romeovs/creep'
license=('MIT')
source=('git://github.com/romeovs/creep.git')
md5sums=('SKIP')
makedepends=('fontforge')

pkgver() {
	cd "$srcdir/creep"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/creep"
	./convert.pe
}

package() {
	cd "$srcdir/creep"
	install -D -m644 creep-16.bdf "$pkgdir/usr/share/fonts/misc/creep-16.bdf"
	install -D -m644 LICENSE      "$pkgdir/usr/share/licenses/bdf-creep/LICENSE"
}
