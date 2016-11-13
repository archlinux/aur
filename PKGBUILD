#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=rabbit_tree
pkgver=2016.11.13
pkgrel=1
pkgdesc='Radix bit tries for implementing associative arrays and sets in C.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/rabbit_tree"
makedepends=(cmake doxygen graphviz)
source=(
  http://xyne.archlinux.ca/projects/rabbit_tree/src/rabbit_tree-2016.11.13.tar.xz
  http://xyne.archlinux.ca/projects/rabbit_tree/src/rabbit_tree-2016.11.13.tar.xz.sig
)
sha512sums=(
  b405ebd2c22103d96fe3d6d09bdbe35d8c178fa53a49bc4b2141ab7d09afd3634fd5b1b41f3e97e37fa9ed7ab2c546e025a0bec0d522053e0efb979d19e85c95
  c8a2a4367986328f398c4ff3f3fcd51ab394a4a6c4213a2e801099eaceb01f0d488c92bd1553b786b36a37c3bca5ff412f4f10511b196d0c365f039ee93e11d2
)
md5sums=(
  1d06ee9762c1eb22b2858bec1c99ccba
  426b2ccdbaf542cb1e86aa1f7e4278b7
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

build ()
{
  mkdir -p "$srcdir/build"
  cd -- "$srcdir/build"
  cmake ../"$pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package ()
{
  cd -- "$srcdir/build"
  make install DESTDIR="$pkgdir"
}

# vim: set ts=2 sw=2 et:
