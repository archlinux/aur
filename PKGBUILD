# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Nahuel Gomez Castro <nahual_gomca@outlook.com.ar>

pkgname='icon-library'
pkgver=0.0.6
pkgrel=2
pkgdesc='Find the right symbolic icon to use on your GNOME application'
arch=('x86_64')
url='https://gitlab.gnome.org/World/design/icon-library'
license=('GPL3')
depends=('gtksourceview4' 'libhandy0')
makedepends=('cmake' 'meson' 'rust')
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('39e96fad4213dcd0709a606d2fb9fb70bad1d9828741cd65498aa097556ef56d')

build() {
  arch-meson "${pkgname}-${pkgver}" 'build'
  meson compile -C 'build'
}

package() {
  DESTDIR="${pkgdir}" meson install -C 'build'
  install -Dvm644 "${pkgname}-${pkgver}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
