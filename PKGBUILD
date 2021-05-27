# Maintainer: Benoît Rouits <brouits at free dor fr>
pkgname=qabc
pkgver=1.6
pkgrel=1
pkgdesc="ABC music notation minimal GUI."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/be1/qabc"
license=('GPL3')
depends=('qt5-base' 'abcm2ps' 'abcmidi' 'fluidsynth' 'shared-mime-info')
makedepends=('qt5-tools')
groups=(abc)
source=("$pkgname-$pkgver.tar.gz::https://github.com/be1/qabc/archive/$pkgver.tar.gz")
sha512sums=('1f5087365d46044a469194af9469c02856668638e75a654ebde1668fc9a2555f143e31aab23a0b7fe8ad2d19562849bfbce63cd8d9130c199f32d065a45f8671')

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
