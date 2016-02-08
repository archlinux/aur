_pkgname=pgtap
pkgname=$_pkgname-git
pkgver=v0.95.0.r21.gfebdfa6
pkgrel=1
pkgdesc="Suite of database functions that make it easy to write TAP-emitting \
unit tests in psql scripts or xUnit-style test functions."
arch=('any')
url="http://pgtap.org"
license=("postgresql")
depends=(postgresql)
source=("git://github.com/theory/pgtap.git")
md5sums=("SKIP")

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_pkgname"
    make
}

package() {
    cd "$srcdir/$_pkgname"
    make DESTDIR="$pkgdir" install
}
