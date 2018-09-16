# Maintainer: Raphael Scholer <rascholer@gmail.com>
pkgname=desktoggle
pkgver=1.6
pkgrel=1
pkgdesc='Hide all windows and show the desktop.'
arch=('i686' 'x86_64')
conflicts=("desktoggle-git")
url='https://github.com/rscholer/desktoggle'
license=('GPL3')
depends=('libx11')
makedepends=('meson')
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ae4772c894b82f36cf3f4e72816193942c2d004ba7f69e323585ef814f946cb3')

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
