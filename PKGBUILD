# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: halhen <halhen at k2h dot se>

pkgname=xmlfs
pkgver=0.1.1
pkgrel=4
pkgdesc='Mount XML files as directory structures'
license=('GPL')
arch=('any')
url='https://github.com/halhen/xmlfs'
depends=('fuse' 'libxml2')
source=("https://github.com/halhen/xmlfs/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('1b6e4d8d3f6615f2c82a5ff65524f5b33cc43eb92a4f301d8020f2144ad24985')

build() {
  cd "${pkgname}-${pkgver}"
  make -C .
}

package() {
  cd "${pkgname}-${pkgver}"
  make PREFIX=/usr MANPREFIX=/usr/man DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
