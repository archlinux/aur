# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Helder Bertoldo <helder.bertoldo@gmail.com>

pkgname=comgen
pkgver=1.1.0
pkgrel=1
pkgdesc='Generate styled comments for your code'
arch=('x86_64')
url='https://github.com/jeremyvaartjes/comgen'
license=('GPL3')
depends=('figlet' 'granite')
makedepends=('meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('59149626b0ea2b01972775817c3798defcc24d31ce668f06adfd62e73236aa4d')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${pkgname}-${pkgver}/README.md"
}

# vim: ts=2 sw=2 et:
