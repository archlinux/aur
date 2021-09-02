# Maintainer: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Jonas Nyrén <jonas.nyren*mindkiller.com>

pkgname=sidplayfp
pkgver=2.2.1
pkgrel=1
pkgdesc="Sidplay2 fork with improved filter emulation"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/sidplay-residfp/"
license=('GPL')
depends=('libsidplayfp>=2.2.2')
reaplces=('sidplay-residfp' 'sidplay-residfp-alsa' 'sidplay-residfp-pulse')
conflicts=('sidplay-residfp' 'sidplay-residfp-alsa' 'sidplay-residfp-pulse')
install=${pkgname}.install
source=("http://downloads.sourceforge.net/project/sidplay-residfp/sidplayfp/2.2/${pkgname}-${pkgver}.tar.gz" "${pkgname}.install")
sha256sums=('8b749697f149b839e8b0a8a479b3fa202a08f51034ab005f37c491c8f6322f1c'
            '4064bb649615a6d8825b7dcddb9880dd766169591e2643b631ef3b6c12171a33')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install
}

