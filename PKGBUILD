pkgname=h5hut
pkgver=2.0.0rc6
pkgrel=1
pkgdesc='High-Performance I/O Library for Particle-based Simulations'
url='https://gitlab.psi.ch/H5hut/src/wikis/home'
arch=('x86_64')
license=('BSD')
depends=('hdf5' 'zlib')
makedepends=()
source=("https://gitlab.psi.ch/H5hut/src/-/archive/H5hut-${pkgver}/src-H5hut-${pkgver}.tar.gz")
sha256sums=('ca09b2b0637966f8b48572610071549fe874accc83caaf5c1e45a21eddf09a6f')

build() {
  cd "${srcdir}/src-H5hut-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr --enable-parallel --enable-shared --disable-static
  make
}

package() {
  cd "${srcdir}/src-H5hut-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
