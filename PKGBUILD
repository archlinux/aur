# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=imageburner
pkgver=1.0.1
pkgrel=1
pkgdesc="Image burner for Pantheon, developed by Artem Anufrij"
arch=(x86_64)
url="https://artemanufrij.github.io/"
license=(GPL3)
depends=(libgranite.so gtk3)
makedepends=(vala meson ninja)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/artemanufrij/imageburner/archive/${pkgver}.tar.gz")
sha256sums=('97143eb0330d8156bbb55153d33e7abead105b4647067347de01f32dbafddc5d')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -d build
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  meson build --prefix=/usr
  ninja -C build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C build install
}
