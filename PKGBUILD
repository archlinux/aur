# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=pipewalker
pkgver=0.9.5
pkgrel=1
pkgdesc="Pieces of a computer network are to be turned, to make all computers connected to the same network"
arch=('i686' 'x86_64')
url="http://pipewalker.sourceforge.net/"
license=('GPL')
depends=('mesa' 'sdl' 'desktop-file-utils' 'libpng')
install=$pkgname.install
source=(https://github.com/artemsen/$pkgname/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('f74f3224ddd7abcbbb72fe7ed4f1cd74cd4fe1ad64ab472d491afb3e18b73c42')

prepare() {
  cd "${srcdir}"/$pkgname-$pkgver

}

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  autoreconf -f -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install

  install -Dm644 ChangeLog "${pkgdir}"/usr/share/doc/$pkgname/ChangeLog
}
