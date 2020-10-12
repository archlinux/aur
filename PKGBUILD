# Maintainer: Levi Webb <?>
_pkgbase=bomutils
pkgname=bomutils-git
pkgver=0.2.r0.g3f7dc2d
pkgrel=1
pkgdesc='Open source tools to create bill-of-materials files used in Mac OS X installers'
url='https://github.com/hogliux/bomutils'
arch=('x86_64')
license=('GPL2')
source=("$_pkgbase::git+https://github.com/hogliux/bomutils")
makedepends=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgbase"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_pkgbase"
    make
}

package() {
    cd "$srcdir/$_pkgbase"
    make DESTDIR="$pkgdir" install
}
