# Maintainer: David Adler <d dot adler aet posteo dot de>

pkgname=padthv1
pkgver=0.8.5
pkgrel=1
pkgdesc="an old-school polyphonic additive synthesizer"
arch=('i686' 'x86_64')
url="https://$pkgname.sourceforge.io/"
license=('GPL')
groups=('lv2-plugins')
depends=('jack' 'liblo' 'lv2' 'qt5-base' 'desktop-file-utils'
         'hicolor-icon-theme' 'shared-mime-info' 'fftw')
makedepends=('qt5-tools')
source=("https://download.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('cb27d4e1133d6912b4fb0c18c05a4bdf')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr \
              --libdir=/usr/lib
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
