# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Alexander Bogdanov <andorn@gmail.com>

pkgname=kchmviewer
pkgver=7.5
pkgrel=1
pkgdesc="A .chm files (MS HTML help file format) viewer"
arch=('i686' 'x86_64')
url="http://kchmviewer.sourceforge.net/"
license=('GPL')
depends=('desktop-file-utils' 'chmlib' 'xdg-utils' 'libzip' 'qt5-webkit')
install=$pkgname.install
changelog=$pkgname.changelog
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('c81f8fb7ac1fe8a5284e03b0d91def61cbd5638f2276c5de8046251755352e53')

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
