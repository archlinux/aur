# Maintainer: Benoît Rouits <brouits at free dor fr>
pkgname=qloud
pkgver=1.4.1
pkgrel=4
pkgdesc="Tool to measure loudspeaker frequency response and distortions."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/molke-productions/qloud"
license=('GPL')
depends=('fftw' 'jack' 'qt5-charts')
conflicts=('qloud-qtcharts')
source=("$pkgname-$pkgver.tar.gz::https://github.com/molke-productions/qloud/archive/v$pkgver.tar.gz")
sha512sums=('f7285bf75aaffdf9a9b8e003375b13f9418c828a4b7fe1d9b1b1a1245c2e57090545c4694b3808f4fccff66a8f495291f4c7cd31787360da05b697ae3d5979c9')

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
