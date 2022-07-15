#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=rabbit_tree
pkgver=2016.11.13
pkgrel=4
pkgdesc='Radix bit tries for implementing associative arrays and sets in C.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/rabbit_tree"
makedepends=(cmake doxygen graphviz)
source=(
  https://xyne.dev/projects/rabbit_tree/src/rabbit_tree-2016.11.13.tar.xz
  https://xyne.dev/projects/rabbit_tree/src/rabbit_tree-2016.11.13.tar.xz.sig
)
sha512sums=(
  b405ebd2c22103d96fe3d6d09bdbe35d8c178fa53a49bc4b2141ab7d09afd3634fd5b1b41f3e97e37fa9ed7ab2c546e025a0bec0d522053e0efb979d19e85c95
  df3e4119aad7257de69383c640fb7cde1b02398c77ac81fdeba81f3d04902c8572ee4c3b0fc16e5f54ce5117b6b13321317eddf847fb4e71e7c18d3cb203e283
)
md5sums=(
  1d06ee9762c1eb22b2858bec1c99ccba
  568b14da04bf4ad58c6e81cd6c6aceaa
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

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
