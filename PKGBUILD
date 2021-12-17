# Maintainer: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Jonas Nyrén <jonas.nyren*mindkiller.com>

pkgname=sidplayfp
pkgver=2.2.2
pkgrel=2
pkgdesc="Sidplay2 fork with improved filter emulation"
arch=('i686' 'x86_64')
url="https://github.com/libsidplayfp/sidplayfp"
license=('GPL')
depends=('libsidplayfp>=2.3.1')
reaplces=('sidplay-residfp' 'sidplay-residfp-alsa' 'sidplay-residfp-pulse')
conflicts=('sidplay-residfp' 'sidplay-residfp-alsa' 'sidplay-residfp-pulse')
install=${pkgname}.install
source=("https://downloads.sourceforge.net/project/sidplay-residfp/${pkgname}/${pkgver%.*}/${pkgname}-${pkgver}.tar.gz" "${pkgname}.install")
sha256sums=('fb6262333abba80b4223452324ee0f3cdccdffabd88a80e441e24970ae2f6f4b'
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

