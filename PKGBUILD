# Maintainer: Alban Vachette <alban.vachette@gmail.com>
pkgname=crfpp-git
pkgver=1.0
pkgrel=1
pkgdesc="CRF++ is a simple, customizable, and open source implementation of Conditional Random Fields (CRFs) for segmenting/labeling sequential data."
license=('GPL')
arch=('any')
url="https://taku910.github.io/crfpp"
makedepends=('git' 'gcc>=3.0.0' 'gcc-libs')
provides=('crfpp')
source=('git+https://github.com/mtlynch/crfpp.git')
sha256sums=('SKIP')
_gitdir="${pkgname%"-git"}"

build() {
  cd "$srcdir/$_gitdir"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitdir"

  make DESTDIR="$pkgdir/" install
}

