# Maintainer: Benoît Rouits <brouits at free dor fr>
pkgname=qabc
pkgver=1.3
pkgrel=1
pkgdesc="ABC music notation minimal GUI."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/be1/qabc"
license=('GPL3')
depends=('qt5-base' 'abcm2ps' 'abcmidi' 'fluidsynth' 'shared-mime-info')
makedepends=('qt5-tools')
groups=(abc)
source=("$pkgname-$pkgver.tar.gz::https://github.com/be1/qabc/archive/$pkgver.tar.gz")
sha512sums=('a9c301c79f37c9483338405bfa10cc014256f762b57dfab50ec49ac81ce924b7c62877831de985fd8f55835008143207144decc25a363d183df75ab7c0bf5448')

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
