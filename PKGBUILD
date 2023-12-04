# Maintainer: Yigit Sever <yigit@yigitsever.com>

pkgname=ryokucha
pkgver=0.1.0
pkgrel=1
pkgdesc="A GTK4 library that includes customized widgets"
arch=('x86_64')
url="https://github.com/ryonakano/ryokucha"
license=('LGPL3')
depends=('gtk4' 'pango')
makedepends=('meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('89b9492b33498f46c4f4dd79ef3cbf526069a5422439766382ffdcd0ba1da159')

build() {
  arch-meson ${pkgname}-${pkgver} build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
