# Maintainer: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Jonas Nyrén <jonas.nyren*mindkiller.com>

pkgname=sidplayfp
pkgver=2.15.2
pkgrel=1
pkgdesc="Sidplay2 fork with improved filter emulation"
arch=('x86_64')
url="https://github.com/libsidplayfp/sidplayfp"
license=('GPL-2.0-only')
depends=('libsidplayfp' 'alsa-lib' 'gcc-libs' 'glibc' 'mpg123')
optdepends=('libpulse')
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('622a122dd32157407d78bdcea91bff47e5fddf12092b0bdb5c3ecf43cd880b59')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}

  autoreconf -fi -I /usr/share/gettext/m4
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

