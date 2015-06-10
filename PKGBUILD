# Maintainer: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Jonas Nyrén <jonas.nyren*mindkiller.com>

pkgname=sidplayfp
pkgver=1.3.1
pkgrel=1
pkgdesc="Sidplay2 fork with improved filter emulation"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/sidplay-residfp/"
license=('GPL')
depends=('libsidplayfp>=1.7.1')
reaplces=('sidplay-residfp' 'sidplay-residfp-alsa' 'sidplay-residfp-pulse')
conflicts=('sidplay-residfp' 'sidplay-residfp-alsa' 'sidplay-residfp-pulse')
install=${pkgname}.install
source=("http://downloads.sourceforge.net/project/sidplay-residfp/sidplayfp/1.3/${pkgname}-${pkgver}.tar.gz")
sha256sums=('6bd10bf6eb40f60d4ba4efaf4325c82203f00af229be1b537ff0163eedd7e32d')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install
}

