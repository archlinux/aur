# Maintainer: willemw <willemw12@gmail.com>
# Contributor: ThecaTTony <thecattony at gmx dot com>
# Contributor: <giacomogiorgianni at gmail dot com>

_pkgname=QuiteRSS
pkgname=quiterss
pkgver=0.18.4
pkgrel=2
pkgdesc="Fast and light RSS/Atom feed reader written in Qt/С++"
arch=('i686' 'x86_64')
url="https://quiterss.org"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-webkit' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('qt5-tools')
install=$pkgname.install
source=(https://github.com/$_pkgname/$pkgname/archive/$pkgver.tar.gz)
sha512sums=('345061e631b1e536fb17f8550ded185128f58ce51366fd0d0ad088dc6cfb61739e9b7edd1f6ebc4eb87a62b8902ea8d17bcf74fdcfd675092dd70cf2ccfaf13d')

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

