# Maintainer: Tarn W. Burton <twburton@gmail.com>
pkgname=clpm
pkgver=0.3.4
pkgrel=1
pkgdesc='Common Lisp Package Manager'
arch=('x86_64')
license=('BSD')
url="https://gitlab.common-lisp.net/clpm/clpm"
depends=('sbcl')
provides=('clpm')
source=($pkgname::git+https://gitlab.common-lisp.net/clpm/clpm.git#tag=v${pkgver})
md5sums=('SKIP')

build() {
  cd $pkgname
  git submodule init
  git submodule update
  sbcl --script scripts/build.lisp
}

package() {
  cd $pkgname
  INSTALL_ROOT=$pkgdir/usr/ sh install.sh
}

