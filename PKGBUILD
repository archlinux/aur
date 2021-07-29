# Maintainer: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Jonas Nyrén <jonas.nyren*mindkiller.com>

pkgname=sidplayfp
pkgver=2.2.0
pkgrel=2
pkgdesc="Sidplay2 fork with improved filter emulation"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/sidplay-residfp/"
license=('GPL')
depends=('libsidplayfp>=2.2.1')
reaplces=('sidplay-residfp' 'sidplay-residfp-alsa' 'sidplay-residfp-pulse')
conflicts=('sidplay-residfp' 'sidplay-residfp-alsa' 'sidplay-residfp-pulse')
install=${pkgname}.install
source=("http://downloads.sourceforge.net/project/sidplay-residfp/sidplayfp/2.2/${pkgname}-${pkgver}.tar.gz" "${pkgname}.install")
sha256sums=('ca1e7c30359ba3e4e7f3b30c3f52b8ef5248a40c36d0d80c85205329638c47ed'
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

