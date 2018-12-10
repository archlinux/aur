# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=hashit
pkgver=1.0.0
pkgrel=1
pkgdesc="Checksum tool for Pantheon, developed by Artem Anufrij"
arch=(x86_64)
url="https://artemanufrij.github.io/"
license=(GPL3)
depends=(libgranite.so gtk3)
makedepends=(vala meson ninja)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/artemanufrij/hashit/archive/${pkgver}.tar.gz")
sha256sums=('d298246a3e00953994ee85434ccc02aaab67bf1b1fd507d9dec72e24694f0cd3')

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
