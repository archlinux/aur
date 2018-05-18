# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Wittfella <wittfella@wittfella.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=qtfm
pkgver=6.0.0_beta1
pkgrel=1
pkgdesc="A lightweight file manager"
arch=('i686' 'x86_64')
url="http://qt-apps.org/content/show.php/QtFM?content=158787"
license=('GPL')
depends=('file' 'qt5-base' 'desktop-file-utils')
makedepends=('git')
source=("$pkgname-${pkgver//_/-}.tar.gz::https://github.com/rodlie/qtfm/archive/${pkgver//_/-}/${pkgver//_/-}.tar.gz" make_it_build_fixes.patch)
sha256sums=('425d463d552df24193fbdca68dcdbecc003cc056fd8d30c9fbf4c777227dd7ce'
            '1a77d7699e60be1af8ba0aef779894599bd46f5bc3545347d3989154d0576642')

build() {
  cd $pkgname-${pkgver//_/-}
  git clone https://github.com/rodlie/libdisks.git
  qmake
  make
}

package() {
  cd $pkgname-${pkgver//_/-}
  make INSTALL_ROOT="${pkgdir}" install
}
