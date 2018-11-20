# Contributor: Joseph Xu <josephzxu@gmail.com>
# Contributor: Yuval Hager <yhager@yhager.com>
# Contributor: Diep Pham Van <imeo@favadi.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-mew
pkgver=6.8
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="Messaging in the Emacs World"
url="http://www.mew.org/"
license=('custom')
depends=('emacs')
optdepends=('ruby')
source=("http://mew.org/Release/mew-${pkgver}.tar.gz")
sha256sums=('cf44c4f9ca704ba1edce7134bc7f38a17361391d5be1090221431a3a06f6bf47')

build() {
  cd mew-${pkgver}
  ./configure --prefix="$pkgdir"/usr
}

package() {
  cd mew-${pkgver}
  make install
  install -D -m644 00copyright \
    "$pkgdir"/usr/share/licenses/emacs-mew/00copyright 
}
