# Maintainer: Gustavo Heinz <gustavo at gsthnz dot com>
# Contributor: Cristian Delgado <cristdelc at gmail dot com>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Dmitrij D. Czarkoff <czarkoff at gmail dot com>
# Contributor: ny-a <nyaarch64 at gmail dot com>

pkgname=re
pkgver=2.2.2
pkgrel=1
pkgdesc="Portable library for real-time communications"
arch=('i686' 'x86_64' 'armv6h')
url="https://github.com/baresip/re"
license=('BSD')
depends=('openssl' 'zlib')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/baresip/re/archive/v${pkgver}.tar.gz")
sha256sums=('25d66108f827507d1a08dc15d4a2a6d994e0cc2368f2faa6778b3a48c0d15f2f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
