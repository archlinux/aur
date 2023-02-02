# Maintainer: Benoît Rouits <brouits at free dor fr>
pkgname=qloud
pkgver=1.4.2
pkgrel=6
pkgdesc="Tool to measure loudspeaker frequency response and distortions."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/molke-productions/qloud"
license=('GPL')
makedepends=('qt5-tools' 'libsndfile')
depends=('fftw' 'jack' 'qt5-charts')
conflicts=('qloud-qtcharts')
source=("$pkgname-$pkgver.tar.gz::https://github.com/molke-productions/qloud/archive/v$pkgver.tar.gz")
sha512sums=('6c402f11850a663aed8f9688065d0d42da75774011d34184aa61db40a8d8e173eab99afe179a9860ef35a8d54c1f51ad9db085bf77bee02f9e9538086764be20')

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
