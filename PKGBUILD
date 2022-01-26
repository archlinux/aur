# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='agenda'
pkgver=1.1.2
pkgrel=1
pkgdesc='A simple, fast, no-nonsense to-do (task) list'
arch=('x86_64')
url='https://github.com/dahenson/agenda'
license=('GPL3')
depends=('granite')
makedepends=('meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('9ccf728661d28c15001c0a9c1db4d9047f7689273c7c100bd36a03bede6a6fd2')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${pkgname}-${pkgver}/README.md"
}

# vim: ts=2 sw=2 et:
