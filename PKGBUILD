# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=pipewalker
pkgver=0.9.4
pkgrel=1
pkgdesc="Pieces of a computer network are to be turned, to make all computers connected to the same network"
arch=('i686' 'x86_64')
url="http://pipewalker.sourceforge.net/"
license=('GPL')
depends=('mesa' 'sdl' 'desktop-file-utils')
install=$pkgname.install
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('d6d7717f1f333847cc4a2e9d83e97b971b3bfb539d99d4ae30a5140de6e386f4')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install

  install -Dm644 ChangeLog "${pkgdir}"/usr/share/doc/$pkgname/ChangeLog
#removing unneeded
  rm -rf "${pkgdir}"/usr/share/menu
}
