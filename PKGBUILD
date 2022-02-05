# Maintainer: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Jonas Nyrén <jonas.nyren*mindkiller.com>

pkgname=sidplayfp
pkgver=2.2.3
pkgrel=1
pkgdesc="Sidplay2 fork with improved filter emulation"
arch=('i686' 'x86_64')
url="https://github.com/libsidplayfp/sidplayfp"
license=('GPL')
depends=('libsidplayfp>=2.3.1')
reaplces=('sidplay-residfp' 'sidplay-residfp-alsa' 'sidplay-residfp-pulse')
conflicts=('sidplay-residfp' 'sidplay-residfp-alsa' 'sidplay-residfp-pulse')
install=${pkgname}.install
source=("https://downloads.sourceforge.net/project/sidplay-residfp/${pkgname}/${pkgver%.*}/${pkgname}-${pkgver}.tar.gz" "${pkgname}.install")
sha256sums=('2941857ea01a51430620e8841ba9a4ef9752633710a4fe495474985af42eafff'
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

