# Maintainer: Benoît Rouits <brouits at free dor fr>
pkgname=qloud
pkgver=1.4.3
pkgrel=6
pkgdesc="Tool to measure loudspeaker frequency response and distortions."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/molke-productions/qloud"
license=('GPL')
makedepends=('qt5-tools' 'libsndfile')
depends=('fftw' 'jack' 'qt5-charts')
conflicts=('qloud-qtcharts')
source=("$pkgname-$pkgver.tar.gz::https://github.com/molke-productions/qloud/archive/v$pkgver.tar.gz")
sha512sums=('d9dd15942708396e8c0838e4404cb539eec08318ec32c9cc5c5c3f4cf2c3e4d20f3867caca4b6ad9a7eda7a0c48cc8be440f91f86bb812422f914cb1d0cc4d94')

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
