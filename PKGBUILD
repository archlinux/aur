# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=libgraphqlparser
pkgver=0.7.0
pkgrel=1
pkgdesc="A GraphQL query parser in C++ with C and C++ APIs"
arch=('i386' 'x86_64')
url="https://github.com/graphql/libgraphqlparser"
license=('BSD')
makedepends=('git' 'cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/graphql/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=(973292b164d0d2cfe453a2f01559dbdb1b9d22b6304f6a3aabf71e2c0a3e24ab69dfd72a086764ad5befecf0005620f8e86f552dacc324f9615a05f31de7cede)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cmake -DCTYPESGEN_FOUND=Off -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
