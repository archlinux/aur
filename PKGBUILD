# Maintainer: Brian Bidulock <bidulock@Openss7.org>

pkgname=vimb-gtk2
_pkgname=vimb
pkgver=2.10
pkgrel=1
pkgdesc="A lightweight vim-like webkit-based browser"
arch=('i686' 'x86_64')
url="https://fanglingsu.github.io/vimb"
license=('GPL3')
depends=('webkitgtk2')
conflicts=('vimb')
provides=('vimb')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/fanglingsu/$_pkgname/archive/$pkgver.tar.gz")
md5sums=('74ff7458e89406fd3537c89507bf6596')

build() {
  cd $_pkgname-$pkgver
  make PREFIX="/usr"
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}

# vim:set ts=2 sw=2 et:
