# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Wittfella <wittfella@wittfella.com>

pkgname=qtfm
pkgver=5.9
pkgrel=3
pkgdesc="A lightweight file manager"
arch=('i686' 'x86_64')
url="http://qt-apps.org/content/show.php/QtFM?content=158787"
license=('GPL')
depends=('file' 'qt5-base' 'desktop-file-utils')
changelog=$pkgname.changelog
source=(https://dl.opendesktop.org/api/files/download/id/1466643163/158787-$pkgname.zip)
sha256sums=('07ffd61dd5d4aa7c16f1c544804517b621e3ef1a30eeda97c087219a3cb35128')

build() {
  cd "${srcdir}"/$pkgname

  qmake
  make
}

package() {
  cd "${srcdir}"/$pkgname

  make INSTALL_ROOT="${pkgdir}" install
}
