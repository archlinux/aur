
# This one is taken by another package:
_pkgname=fm

# So let's use this one instead
pkgname=fourier-motzkin
pkgver=0.5.0
pkgrel=1
pkgdesc="The FM library allows to project systems of linear inequalities."
arch=('i686' 'x86_64')
url="http://web.cse.ohio-state.edu/~pouchet/software/fm"
license=('LGPL3')
depends=()
source=("$url/download/$_pkgname-$pkgver.tar.gz")
md5sums=('0e63380d59931f19643c03ce45c9b76c')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
