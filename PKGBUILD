# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Alexander Bogdanov <andorn@gmail.com>

pkgname=kchmviewer
pkgver=7.2
pkgrel=2
pkgdesc="A .chm files (MS HTML help file format) viewer"
arch=('i686' 'x86_64')
url="http://kchmviewer.sourceforge.net/"
license=('GPL')
depends=('desktop-file-utils' 'chmlib' 'kdebase-runtime' 'xdg-utils' 'libzip')
makedepends=('automoc4' 'cmake')
options=('libtool')
install=$pkgname.install
changelog=$pkgname.changelog
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-7.2.1.tar.gz)
sha256sums=('91c5a74b26956e76400a02285d534d1eebbb51ee478dcaaab7beff7aa870772a')

build() {
  cd $pkgname-$pkgver

  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="${pkgdir}" install

#icon file
  install -Dm644 packages/$pkgname.png "${pkgdir}"/usr/share/pixmaps/$pkgname.png
}
