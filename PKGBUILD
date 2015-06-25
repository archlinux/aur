# Contributor: masutu < masutu dot arch dot googlemail dot com >
# Maintainer: masutu < masutu dot arch dot googlemail dot com >
pkgname=qloud
pkgver=1.0
pkgrel=1
pkgdesc="A tool to measure a loudspeaker frequency response and distortions."
arch=('i686' 'x86_64')
url="http://gaydenko.com/qloud"
license=('GPL')
depends=('fftw' 'jack' 'qwt')
source=($url/download/$pkgname-$pkgver.tar.bz2)
md5sums=('64db0c91fa6fc7f9a9f1fb2187fa61ab')


build() {
  cd "$srcdir/$pkgname-$pkgver"
  qmake-qt4
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 bin/qloud $pkgdir/usr/bin/qloud
  install -Dm755 README $pkgdir/usr/share/$pkgname/README
}

# vim:set ts=2 sw=2 et:
