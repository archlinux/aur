# Maintainer: robertfoster

_pkgname=charm-crypto
pkgname=python-${_pkgname}-git
pkgver=v0.43.r151.g3527a695
pkgrel=1
pkgdesc="A framework for rapidly prototyping advanced cryptosystems"
arch=(i686 x86_64)
url="https://github.com/JHUISI/charm"
license=('LGPL3')
depends=('openssl' 'pbc' 'python-pyparsing')
makedepends=('python')
source=("${_pkgname}::git+https://github.com/JHUISI/charm.git")

pkgver() {
  cd $srcdir/${_pkgname}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/${_pkgname}
  ./configure.sh --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd $srcdir/${_pkgname}
  python setup.py install --root=$pkgdir
}

md5sums=('SKIP')
