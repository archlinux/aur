# Maintainer: Raphael Scholer <rascholer@gmail.com>
pkgname=desktoggle
pkgver=1.7
pkgrel=1
pkgdesc='Hide all windows and show the desktop.'
arch=('i686' 'x86_64')
conflicts=("desktoggle-git")
url='https://github.com/rscholer/desktoggle'
license=('GPL3')
depends=('libx11')
makedepends=('asciidoc' 'meson')
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/v${pkgver}.tar.gz")
sha256sums=('1ee192cdf6c65d256a4f931c75028c4fb4bbf896f491336b06d80c084be817fc')

build() {
  cd "${pkgname}-${pkgver}"

  arch-meson build
  ninja -C build
}

package() {
  cd "${pkgname}-${pkgver}"

  DESTDIR="${pkgdir}" meson install -C build
}
# vim:set ts=2 sw=2 et:
