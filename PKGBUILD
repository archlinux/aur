# Maintainer: Dan Johansen <strit@strits.dk>

_pkgname=wf-config-hjson
pkgname=wayfire-plugins-wfconfig-hjson
pkgver=0.8.0.1
pkgrel=3
pkgdesc="Wayfire plugin to read/write the configuration in the hjson format. Usage: wayfire --backend hjson-config-backend --config /path/to/config/file.hjson"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/wayfireplugins/${_pkgname}"
license=('MIT')
depends=('wayfire')
makedepends=('meson' 'ninja' 'glm')
source=("https://gitlab.com/wayfireplugins/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('1023dd91f0964df639e3b4ff3d6dc227')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}

