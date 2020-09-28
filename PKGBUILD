# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='spectator'
pkgver=0.4.3
pkgrel=1
pkgdesc='Comfortably test your REST APIs'
arch=('x86_64')
url='https://github.com/treagod/spectator'
license=('GPL3')
depends=('duktape' 'granite' 'gtksourceview3' 'webkit2gtk')
makedepends=('meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('7ac4e0fb85a630a3f4a2bddf482186a3db990a20b92d25c6e243abbb366fda75')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${pkgname}-${pkgver}/README.md"
}

# vim: ts=2 sw=2 et:
