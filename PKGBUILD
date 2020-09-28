# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='prettifier'
pkgver=1.1.4
pkgrel=1
pkgdesc='Simple application that makes your JSON/XML requests/responses prettier to read'
arch=('x86_64')
url='https://github.com/fleury08/prettifier'
license=('MIT')
depends=('granite' 'gtksourceview3')
makedepends=('meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('a5b3f6a8b8cf7e6e1b82b5d813ebef0a76a3023ce3f5a03ffb196db1938d67d1')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${pkgname}-${pkgver}/README.md"
  install -Dm644 "${pkgname}-${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
