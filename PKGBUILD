# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='workspaces'
pkgver=3.1.0
pkgrel=1
pkgdesc='Configure and quickly launch all you need to work on a project'
arch=('x86_64')
url='https://github.com/DevAlien/workspaces'
license=('GPL3')
depends=('granite')
makedepends=('json-glib' 'libgee' 'meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('296b3cc0f4740a220b5d6b4273e99e8fffde65ba4e6c840a3954ad355ba6c003')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${pkgname}-${pkgver}/README.md"
}

# vim: ts=2 sw=2 et:
