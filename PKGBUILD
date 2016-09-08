# Contributor: Eugenio M. Vigo <emvigo@gmail.com>
# Contributor: speps <speps dot aur dot archlinux dot org>

pkgname=pumpa
pkgver=0.9.2
pkgrel=1
pkgdesc="simple pump.io client written in C++ and Qt"
arch=('i686' 'x86_64')
url="http://pumpa.branchable.com"
license=('GPL3')
depends=('qt5-base' 'aspell' 'hicolor-icon-theme' 'tidyhtml')
makedepends=('git')
install="$pkgname.install"
source=(${pkgname}::git://pumpa.branchable.com/#tag=v${pkgver})
sha256sums=('SKIP')


build() {
  cd $pkgname-$pkgver
  qmake PREFIX=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make INSTALL_ROOT="$pkgdir/" install
}
