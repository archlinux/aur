_pkgname=python2-timbl
pkgname=${_pkgname}-git
pkgver=41
pkgrel=3
pkgdesc='Python binding for Timbl, a k-Nearest Neighbours machine learning suite'
arch=('i686' 'x86_64')
url="https://github.com/proycon/python-timbl"
license=('GPL')
depends=('python2' 'libxml2' 'boost' 'timbl')
makedepends=('git' 'libtool')
provides=("${_pkgname}")
source=("git://github.com/proycon/python-timbl.git")
_gitname=("python-timbl")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    git rev-list --count HEAD
}

build() {
    cd "$srcdir/$_gitname"
    python2 setup2.py build_ext --timbl-library-dir=/usr/lib --timbl-include-dir=/usr/include/  build
}

package() {
    cd "$srcdir/$_gitname"
    python2 setup2.py build_ext --timbl-library-dir=/usr/lib --timbl-include-dir=/usr/include/ install --prefix=/usr --root="${pkgdir}"
}

