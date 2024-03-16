# Maintainer: Dan Johansen <strit@strits.dk>

_pkgname=desq-shell
pkgname=wayfire-plugins-desq-shell
pkgver=0.8.0.1
pkgrel=3
pkgdesc="Provides interfaces to set backgrounds, panels, and drop-downs in DesQ. It also contains the implementation for Wayfire in the form of wayfire plugin"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/wayfireplugins/${_pkgname}"
license=('MIT')
depends=('wayfire')
makedepends=('meson' 'ninja' 'glm')
source=("https://gitlab.com/wayfireplugins/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('d0c289ffd16895282e94c6f1d901750d')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}

