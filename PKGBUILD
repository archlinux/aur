pkgname=json-stroller-git
pkgver=v1.2
pkgrel=1
pkgdesc="A ncurse tool for viewing json files and displaying differences between json formatted data"
arch=('i686' 'x86_64')
license=('GPL3')
depends=()
source=("$pkgname::git://github.com/isundil/jsonStroller.git")
md5sums=('SKIP')

build() {
    cd $pkgname
    cmake -DCMAKE_BUILD_TYPE=Release
    make all doc test
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir" install
}

