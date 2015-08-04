# Contributor: Joseph Xu <josephzxu@gmail.com>
# Contributor: Yuval Hager <yhager@yhager.com>
# Contributor: Diep Pham Van <imeo@favadi.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-mew
pkgver=6.7
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Messaging in the Emacs World"
url="http://www.mew.org/"
license=('custom')
depends=('emacs')
optdepends=('ruby')
source=("http://mew.org/Release/mew-${pkgver}.tar.gz")
md5sums=('feb81a0ff420f00c5bc5b5287721991a')
install=emacs-mew.install

build()
{
  cd $srcdir/mew-${pkgver}
  ./configure --prefix=$pkgdir/usr
}

package() {
  cd $srcdir/mew-${pkgver}
  make install
  rm $pkgdir/usr/share/info/dir
  install -D -m644 $srcdir/mew-$pkgver/00copyright \
    $pkgdir/usr/share/licenses/emacs-mew/00copyright 
}
