# Maintainer: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Jonas Nyrén <jonas.nyren*mindkiller.com>

pkgname=sidplayfp
pkgver=2.15.1
pkgrel=1
pkgdesc="Sidplay2 fork with improved filter emulation"
arch=('x86_64')
url="https://github.com/libsidplayfp/sidplayfp"
license=('GPL-2.0-only')
depends=('libsidplayfp' 'alsa-lib' 'gcc-libs' 'glibc' 'mpg123')
optdepends=('libpulse')
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('b8a4e63fbc8eb14d16f464a17dc2b0c3881341777e24519791edb2de57fe17f8')

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

