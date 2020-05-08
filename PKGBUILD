# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: masutu < masutu dot arch dot googlemail dot com >
pkgname=qloud
pkgver=1.3.alpha.r3.ge99e491
pkgrel=1
pkgdesc="A tool to measure a loudspeaker frequency response and distortions."
arch=('i686' 'x86_64')
url="https://github.com/molke-productions/qloud"
license=('GPL')
depends=('fftw' 'jack' 'qwt')
source=(git+https://github.com/molke-productions/qloud.git)
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  qmake
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 bin/qloud $pkgdir/usr/bin/qloud
}

# vim:set ts=2 sw=2 et:
