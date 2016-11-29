# Contributor: Eugenio M. Vigo <emvigo@gmail.com>
# Contributor: speps <speps dot aur dot archlinux dot org>

pkgname=pumpa
pkgver=0.9.3
pkgrel=1
pkgdesc="Simple pump.io client written in C++ and Qt"
arch=('i686' 'x86_64')
url="http://pumpa.branchable.com"
license=('GPL3')
depends=('qt5-base' 'aspell' 'hicolor-icon-theme' 'tidy')
makedepends=('git')
source=("$pkgname-$pkgver::git://pumpa.branchable.com/#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd $pkgname-$pkgver

  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd $pkgname-$pkgver

  make INSTALL_ROOT="$pkgdir" install
}
