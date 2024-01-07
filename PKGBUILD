# Maintainer: Yigit Sever <yigit@yigitsever.com>

pkgname=ryokucha
pkgver=0.2.0
pkgrel=1
pkgdesc="A GTK4 library that includes customized widgets"
arch=('x86_64')
url="https://github.com/ryonakano/ryokucha"
license=('LGPL3')
depends=('gtk4' 'pango')
makedepends=('meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('40c038798cafd6f8f2de00b19a27b89042197a301b256b2afa8da35fcc21a2f6')

build() {
  arch-meson ${pkgname}-${pkgver} build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
