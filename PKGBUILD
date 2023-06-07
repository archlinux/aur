# Maintainer: Benoît Rouits <brouits at free dot fr>
pkgname=qabc
pkgver=1.10
pkgrel=1
pkgdesc="ABC music notation minimal GUI."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/be1/qabc"
license=('GPL3')
depends=('qt5-base' 'abcm2ps' 'abcmidi' 'fluidsynth' 'shared-mime-info')
makedepends=('qt5-tools')
groups=(abc)
source=("$pkgname-$pkgver.tar.gz::https://github.com/be1/qabc/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('f9c9d5adaccd9a608d0ec047db9e8094cc21899024b5a025b202788115c8230b84f3422a81cc6660611c29144d81870210f8f06554a071de02e7741e038c5480')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  qmake PREFIX=/usr -config release
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install INSTALL_ROOT="${pkgdir}"
}

# vim:set ts=2 sw=2 et:
