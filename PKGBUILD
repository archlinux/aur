# Contributor: Joseph Xu <josephzxu@gmail.com>
# Contributor: Yuval Hager <yhager@yhager.com>
# Contributor: Diep Pham Van <imeo@favadi.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-mew
pkgver=6.8
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Messaging in the Emacs World"
url="http://www.mew.org/"
license=('custom')
depends=('emacs')
optdepends=('ruby')
source=("http://mew.org/Release/mew-${pkgver}.tar.gz")
md5sums=('9601f98c8d3adb229841601aecd17035')

build()
{
  cd mew-${pkgver}
  ./configure --prefix=$pkgdir/usr
}

package() {
  cd mew-${pkgver}
  make install
  rm "$pkgdir"/usr/share/info/dir
  install -D -m644 00copyright \
    "$pkgdir"/usr/share/licenses/emacs-mew/00copyright 
}
