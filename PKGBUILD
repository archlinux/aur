# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='spectator'
pkgver=0.5.5
pkgrel=1
pkgdesc='Comfortably test your REST APIs'
arch=('x86_64')
url='https://github.com/treagod/spectator'
license=('GPL3')
depends=('duktape' 'granite' 'gtksourceview3' 'webkit2gtk')
makedepends=('meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('da3a4768f25a51ca830ad861b6727b611bd64f48356e3cc50cd7660c4d77691c')

build() {
  arch-meson "${pkgname}-${pkgver}" 'build'
  meson compile -C 'build'
}

package() {
  DESTDIR="${pkgdir}" meson install -C 'build'
  install -Dvm644 "${pkgname}-${pkgver}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
