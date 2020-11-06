# Maintainer: Benoît Rouits <brouits at free dor fr>
pkgname=qloud-qtcharts
_pkgname=qloud
pkgver=1.4
_pkgver=v1.4
pkgrel=4
pkgdesc="Tool to measure loudspeaker frequency response and distortions. QtCharts flavour."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/molke-productions/qloud"
license=('GPL')
depends=('fftw' 'jack' 'qt5-charts')
conflicts=('qloud')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/molke-productions/$_pkgname/archive/$_pkgver.tar.gz")
sha512sums=('f7b6d854b410f637b6c0e9167f11f422519549f79b0356b8c9608bc26be1b4d210dd8388cfedebf2fa9a3722cf9a032a8bdc463228fef0883ddc3365afede42b')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  qmake PREFIX=/usr -config release
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make install INSTALL_ROOT="${pkgdir}"
}

# vim:set ts=2 sw=2 et:
