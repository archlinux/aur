# Maintainer: willemw <willemw12@gmail.com>
# Contributor: ThecaTTony <thecattony at gmx dot com>
# Contributor: <giacomogiorgianni at gmail dot com>

_pkgname=QuiteRSS
pkgname=quiterss
pkgver=0.18.5
pkgrel=1
pkgdesc="Fast and light RSS/Atom feed reader written in Qt/С++"
arch=('i686' 'x86_64')
url="https://quiterss.org"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-webkit' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('qt5-tools')
install=$pkgname.install
source=(https://github.com/$_pkgname/$pkgname/archive/$pkgver.tar.gz)
sha512sums=('1eab7b961e2a0150812e3d22aa8b7627cd58513c109b05b8b7eb3f55e0ee40462714b6f65852d7a7fb53fce125dcbc988101c3d6f2ba9827771ff9bf93316e75')

build() {
  cd $pkgname-$pkgver
  qmake-qt5 "$srcdir/$pkgname-$pkgver/$_pkgname.pro" \
            PREFIX=/usr \
            CONFIG+=LINUX_INTEGRATED \
            DISABLE_PHONON=1 \
            INSTALL_ROOT_PATH="$pkgdir/"
  make
}

package() {
  cd $pkgname-$pkgver
  make INSTALL_ROOT="$pkgdir/" install
}

