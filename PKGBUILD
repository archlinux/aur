#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=rabbit_tree
pkgver=2014
pkgrel=2
pkgdesc='Radix bit tries for implementing associative arrays and sets in C.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/rabbit_tree"
makedepends=(cmake doxygen graphviz)
source=(
  http://xyne.archlinux.ca/projects/rabbit_tree/src/rabbit_tree-2014.tar.xz
  http://xyne.archlinux.ca/projects/rabbit_tree/src/rabbit_tree-2014.tar.xz.sig
)
sha512sums=(
  a185fd91df87d450899599fea36a7f722185454296b80554045cdd4c66efa5b3867e6e5229a3bcdf20174aa94248386a1cbc436e0a7ddd4bca6edab30f52ba6d
  22edc97190ff52b2477edd8e6efe4952178f99a6d3f3293a379c87e99e4d1b42104fed01db8afcf4c50981024f689a1de623414717a47f7fe36cd20fa3940abc
)
md5sums=(
  09b3c5bd14ca4ee5cee3c67c61a498a4
  a0934a44ec3310d93b9eff590a4f9925
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
