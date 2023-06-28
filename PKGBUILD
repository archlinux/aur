# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=typewriter
pkgver=0.6.1
pkgrel=1
pkgdesc='Minimal writer with autosave'
arch=('x86_64')
url='https://github.com/manexim/typewriter'
license=('GPL3')
depends=('granite' 'gtksourceview4' 'libhandy')
makedepends=('meson' 'vala' 'cmake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('6b8bd3fc30af7681f76a8f77af65ddd003fae0b55fc1337af2e12fec8990da5a')

build() {
  arch-meson "${pkgname}-${pkgver}" 'build'
  meson compile -C 'build'
}

package() {
  DESTDIR="${pkgdir}" meson install -C 'build'
  install -Dvm644 "${pkgname}-${pkgver}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
