# Maintainer: Petteri Tolonen <petteri dot tolonen at gmail dot com>

pkgname=freedink-data
pkgver=1.08.20170409
pkgrel=1
pkgdesc="Free game data for GNU FreeDink"
arch=('any')
url="http://www.freedink.org/"
license=('GPL' 'custom')
source=(ftp://ftp.gnu.org/gnu/freedink/$pkgname-$pkgver.tar.gz)
sha256sums=('e1f1e23c7846bc74479610a65cc0169906e844c5193f0d83ba69accc54a3bdf5')

package() {
   cd $srcdir/$pkgname-$pkgver/
   
   mkdir -p $pkgdir/usr/share/licenses/$pkgname
   cp licenses/* $pkgdir/usr/share/licenses/$pkgname/

   make install DESTDIR=$pkgdir PREFIX=/usr || return 1
}

