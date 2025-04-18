# Maintainer: Axel McLaren <scm(at)axml(dot)uk>

pkgname=krep
pkgver=1.1.2
pkgrel=1
pkgdesc="fast text search tool with advanced algorithms, SIMD acceleration, multi-threading, and regex support"
arch=('x86_64' 'aarch64')
url="https://github.com/davidesantangelo/krep"
license=('BSD')
depends=('glibc')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('99f17d33577861cb2d445345b159652f7f32bbb7d070314ca685d4ced74f2a81')

build() {
  cd "${pkgname}-${pkgver}"

  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make PREFIX=/usr DESTDIR="${pkgdir}" install

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
