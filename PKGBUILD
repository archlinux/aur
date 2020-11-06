# Maintainer: Benoît Rouits <brouits at free dor fr>
pkgname=qloud-qtcharts
_pkgname=qloud
pkgver=1.4
_pkgver=v1.4
pkgrel=3
pkgdesc="Tool to measure loudspeaker frequency response and distortions. QtCharts flavour."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/molke-productions/qloud"
license=('GPL')
depends=('fftw' 'jack' 'qt5-charts')
conflicts=('qloud')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/molke-productions/$_pkgname/archive/$_pkgver.tar.gz")
sha512sums=('3c10bcd8037c2759a84d25e83e611b574bcbf563acc6eed375b00a28cc782ce822889a17f02abcf5937862efe817ddccf2dbecd1cad1dd43e4f352f64a711c61')

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
