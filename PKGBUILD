# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=ternimal
pkgver=0.1.0
pkgrel=1
pkgdesc="Simulate a lifeform in the terminal"
arch=('x86_64' 'i686' 'armv7h')
url="https://github.com/p-e-w/ternimal"
license=('GPL3')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/p-e-w/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('4d37f49a35de5ac23d88a61180d663ba3c2da089418818a588de31f9e920f8d6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  rustc -O ternimal.rs
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -D ternimal -t "${pkgdir}/usr/bin"
}

# vim:set ts=2 sw=2 et:
