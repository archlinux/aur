# Maintainer: Jaroslav Lichtblau <svetlemory@archlinux.org>
# Contributor: Alexander Bogdanov <andorn@gmail.com>

pkgname=kchmviewer
pkgver=7.1
pkgrel=1
pkgdesc="A .chm files (MS HTML help file format) viewer"
arch=('i686' 'x86_64')
url="http://kchmviewer.sourceforge.net/"
license=('GPL')
depends=('desktop-file-utils' 'chmlib' 'kdebase-runtime' 'xdg-utils' 'libzip')
makedepends=('automoc4' 'cmake')
options=('libtool')
install=$pkgname.install
changelog=$pkgname.changelog
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('a410d0a343d8a871cc860e2983079981806eb70cbf0c970fa1bcf5689821144f')

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
