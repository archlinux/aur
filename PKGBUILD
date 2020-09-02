# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='workspaces'
pkgver=3.0.0
pkgrel=1
pkgdesc='Configure and quickly launch all you need to work on a project'
arch=('x86_64')
url='https://github.com/DevAlien/workspaces'
license=('GPL3')
depends=('granite')
makedepends=('json-glib' 'libgee' 'meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('7cb9f5ab61e09301486c6b0acedf63593e23d7d507b893e26904238bff7ed270')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${pkgname}-${pkgver}/README.md"
}

# vim: ts=2 sw=2 et:
