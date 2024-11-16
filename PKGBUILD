# Maintainer: Benoît Rouits <brouits at free dot fr>
pkgname=qabc
pkgver=1.13
pkgrel=1
pkgdesc="ABC music notation minimal GUI."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/be1/qabc"
license=('GPL3')
depends=('qt6-base' 'abcm2ps' 'abcmidi' 'fluidsynth' 'shared-mime-info')
makedepends=('qt6-tools')
groups=(abc)
source=("$pkgname-$pkgver.tar.gz::https://github.com/be1/qabc/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('b5eb3f85f192b1d0fa3cda676ccb29b2aa7f62d1356935ad5e2d7cb2ba5a93219a4e79ec6ee4715230d5337b46d0b8e8ba35d2147c180ab42e62683bd188c2e7')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  qmake6 PREFIX=/usr -config release
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install INSTALL_ROOT="${pkgdir}"
}

# vim:set ts=2 sw=2 et:
