# Maintainer: Marc Cousin <cousinmarc@gmail.com>

pkgname=python-pglast-git
pkgver=v1.5.r0.gda74397
pkgrel=1
pkgdesc="PostgreSQL Languages AST and statements prettifier"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/lelit/pglast"
license=('GPL3')
options=('!emptydirs')
source=('git://github.com/lelit/pglast.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/pglast"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/pglast"


  msg2 'Building...'
  git submodule init
  git submodule update
  python setup.py build
}

package() {
  cd "$srcdir/pglast"

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}

