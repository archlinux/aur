# Maintainer: Evan McCarthy <evan@mccarthy.mn>

pkgname=libretls
pkgver=3.2.1
pkgrel=1
pkgdesc='Port of libtls from LibreSSL to OpenSSL. Aims to make the libtls API more easily and widely available.'
arch=('x86_64')
url="https://git.causal.agency/${pkgname}/"
license=('ISC')
depends=('openssl')
source=("https://causal.agency/${pkgname}/${pkgname}-${pkgver}.tar.gz")
b2sums=('f7e891296a7c810af7d0bdefe64f9674b49d7cb0e96758b2157bae218ee60ef8a3621bf7e82972b1def13b5f810c8df488037435a1985d8126918ba7aef0abf0')

build() {
      cd "${pkgname}-${pkgver}"
      ./configure --prefix=/usr
      make all
}

package() {
      cd "${pkgname}-${pkgver}"
          make DESTDIR="$pkgdir/" install
}
