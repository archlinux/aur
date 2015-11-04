# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Alexander Bogdanov <andorn@gmail.com>

pkgname=kchmviewer
pkgver=7.4
pkgrel=1
pkgdesc="A .chm files (MS HTML help file format) viewer"
arch=('i686' 'x86_64')
url="http://kchmviewer.sourceforge.net/"
license=('GPL')
depends=('desktop-file-utils' 'chmlib' 'xdg-utils' 'libzip' 'qt5-webkit')
install=$pkgname.install
changelog=$pkgname.changelog
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('5f34c7915523e03651186007d41d2b71cff8d6f8061fc35aadfb751cd20dfae3')

build() {
  cd $pkgname-$pkgver

  qmake PREFIX=/usr
  make
}

package() {
  cd $pkgname-$pkgver

#   make DESTDIR="${pkgdir}" install

   install -Dm755 bin/$pkgname "${pkgdir}"/usr/bin/$pkgname
#icon/desktop file
  install -Dm644 packages/$pkgname.png "${pkgdir}"/usr/share/pixmaps/$pkgname.png
  install -Dm644 packages/$pkgname.desktop "${pkgdir}"/usr/share/applications/$pkgname.desktop
}
