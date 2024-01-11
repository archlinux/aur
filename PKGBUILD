# Maintainer: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Jonas Nyrén <jonas.nyren*mindkiller.com>

pkgname=sidplayfp
pkgver=2.6.2
pkgrel=1
pkgdesc="Sidplay2 fork with improved filter emulation"
arch=('i686' 'x86_64')
url="https://github.com/libsidplayfp/sidplayfp"
license=('GPL')
depends=('libsidplayfp>=2.6.0' 'alsa-lib' 'gcc-libs' 'glibc')
optdepends=('libpulse')
reaplces=('sidplay-residfp' 'sidplay-residfp-alsa' 'sidplay-residfp-pulse')
conflicts=('sidplay-residfp' 'sidplay-residfp-alsa' 'sidplay-residfp-pulse')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('36ffc9182339c8925451fa31f3f3c1a3434d6392de9e8fd21f000f5f01e75201')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}

  autoreconf -fi
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install
}

