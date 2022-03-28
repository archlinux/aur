# Maintainer: ny-a <nyaarch64 at gmail dot com>
# Contributor: Cristian Delgado <cristdelc at gmail dot com>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Dmitrij D. Czarkoff <czarkoff at gmail dot com>

pkgname=re
pkgver=2.1.1
pkgrel=1
pkgdesc="Portable library for real-time communications"
arch=('i686' 'x86_64' 'armv6h')
url="https://github.com/baresip/re"
license=('BSD')
depends=('openssl' 'zlib')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/baresip/re/archive/v${pkgver}.tar.gz"
        "re-flags.patch")
sha256sums=('6da4026a0ae1af9c5c679b9ee896e74d7696d1160e3cee6446324b6f836484df'
            'd269af3a87305cef303069cc1287be0b504c2bcf48160866fa05e7951d38f2f7')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/re-flags.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
