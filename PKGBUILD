# Maintainer: Benoît Rouits <brouits at free dot fr>
pkgname=qabc
pkgver=1.9.1
pkgrel=1
pkgdesc="ABC music notation minimal GUI."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/be1/qabc"
license=('GPL3')
depends=('qt5-base' 'abcm2ps' 'abcmidi' 'fluidsynth' 'shared-mime-info')
makedepends=('qt5-tools')
groups=(abc)
source=("$pkgname-$pkgver.tar.gz::https://github.com/be1/qabc/archive/$pkgver.tar.gz")
sha512sums=('622c7860daec09d8c4ad36aa1700c522eed7ae992115bfc62664535012b4ddfbaff11604a0a2b34f1e1db9529067571286f66f962f792909673f3cb66c0d06cb')

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
