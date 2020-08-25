# Maintainer: Evan McCarthy <evan@mccarthy.mn>

pkgname=libretls
pkgver=3.2.0
pkgrel=1
pkgdesc='Port of libtls from LibreSSL to OpenSSL. Aims to make the libtls API more easily and widely available.'
arch=('x86_64')
url='https://git.causal.agency/libretls/'
license=('ISC')
depends=('openssl')
source=("https://causal.agency/libretls/${pkgname}-${pkgver}.tar.gz")
sha512sums=("393372e9552d54e7d926907f63c8954192d97c54870b2a6781c8df7a732fada51f36d1b82317f565df96ef09fcf35cf4622698b21f4afbac926a70000659737d")

build() {
      cd "${pkgname}-${pkgver}"
      ./configure --prefix=/usr
      make all
}

package() {
      cd "${pkgname}-${pkgver}"
          make DESTDIR="$pkgdir/" install
}
