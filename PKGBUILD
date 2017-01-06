# Contributor: masutu < masutu dot arch dot googlemail dot com >
# Maintainer: masutu < masutu dot arch dot googlemail dot com >
pkgname=qloud
pkgver=1.2
pkgrel=1
pkgdesc="A tool to measure a loudspeaker frequency response and distortions."
arch=('i686' 'x86_64')
url="http://gaydenko.com/qloud"
license=('GPL')
depends=('fftw' 'jack' 'qwt')
source=($url/download/$pkgname-$pkgver.tar.bz2)
md5sums=('6b41200bafa492eb32654cd82f4a9629')


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
