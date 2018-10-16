# Maintainer: Raphael Scholer <rascholer@gmail.com>
pkgname=desktoggle
pkgver=1.8.1
pkgrel=1
pkgdesc='Hide all windows and show the desktop.'
arch=('i686' 'x86_64')
conflicts=("desktoggle-git")
url='https://github.com/rscholer/desktoggle'
license=('GPL3')
depends=('libx11')
makedepends=('meson' 'python-docutils')
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/v${pkgver}.tar.gz")
sha256sums=('43e779c781e77f3de8267ecf60073de0f17564a3a0e598b4bd4f346b8ba060ce')

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
