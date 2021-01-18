# Original Maintainer: Evan McCarthy <evan@mccarthy.mn>
# Maintainer: lillian rose winter <hi@neko.vg>

pkgname=libretls
pkgver=3.3.1
pkgrel=1
pkgdesc='Port of libtls from LibreSSL to OpenSSL. Aims to make the libtls API more easily and widely available.'
arch=('x86_64')
url="https://git.causal.agency/${pkgname}/"
license=('ISC')
depends=('openssl')
source=("https://causal.agency/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('c697a6a2250a4bedf8e06c0210d40cce')

build() {
      cd "${pkgname}-${pkgver}"
      ./configure --prefix=/usr
      make all
}

package() {
      cd "${pkgname}-${pkgver}"
          make DESTDIR="$pkgdir/" install
}
