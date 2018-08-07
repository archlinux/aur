# Maintainer: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Jonas Nyrén <jonas.nyren*mindkiller.com>

pkgname=sidplayfp
pkgver=1.4.4
pkgrel=1
pkgdesc="Sidplay2 fork with improved filter emulation"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/sidplay-residfp/"
license=('GPL')
depends=('libsidplayfp>=1.8.8')
reaplces=('sidplay-residfp' 'sidplay-residfp-alsa' 'sidplay-residfp-pulse')
conflicts=('sidplay-residfp' 'sidplay-residfp-alsa' 'sidplay-residfp-pulse')
install=${pkgname}.install
source=("http://downloads.sourceforge.net/project/sidplay-residfp/sidplayfp/1.4/${pkgname}-${pkgver}.tar.gz")
sha256sums=('35fc69c2a18d2602be7646748bdf620b8062f290556221a8b2513be0c6cb3a2b')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install
}

