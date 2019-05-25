# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-fisher
_pkgname=fishers_exact_test
pkgver=0.1.5
_commit_hash=c8af5911e668a73e566fa4adee18ccba1a327d02
pkgrel=1
pkgdesc="Fishers Exact Test"
arch=('any')
url=https://github.com/brentp/fishers_exact_test
license=('unknown')
depends=('python')
makedepends=('python-setuptools' 'cython')
#source=("https://github.com/brentp/fishers_exact_test/archive/${pkgver}.tar.gz")
source=("${_pkgname}-${pkgver}.tar.gz"::"https://github.com/brentp/fishers_exact_test/archive/${_commit_hash}.tar.gz")
sha256sums=('8e5fd217d87ff711a891919a84097f18ff42904270f477b4e4251ef6f82d44cb')

prepare() {
  cd "$srcdir/$_pkgname-$_commit_hash"
  cd src
  cython cfisher.pyx
}

build() {
  #cd "$srcdir/$_pkgname-$pkgver"
  cd "$srcdir/$_pkgname-$_commit_hash"
  python setup.py build
}


package(){
  #cd "$srcdir/$_pkgname-$pkgver"
  cd "$srcdir/$_pkgname-$_commit_hash"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
