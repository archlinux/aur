# Maintainer: Benoît Rouits <brouits at free dot fr>
pkgname=qabc
pkgver=1.8
pkgrel=1
pkgdesc="ABC music notation minimal GUI."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/be1/qabc"
license=('GPL3')
depends=('qt5-base' 'abcm2ps' 'abcmidi' 'fluidsynth' 'shared-mime-info')
makedepends=('qt5-tools')
groups=(abc)
source=("$pkgname-$pkgver.tar.gz::https://github.com/be1/qabc/archive/$pkgver.tar.gz")
sha512sums=('9d51b803a5cc56587202bea3de5bc44e5f3160752dcdec82ee222c457b674d52331dd170bf37b486b84c534395eb334f7813dd92b88707603a698fdb11b3a033')

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
