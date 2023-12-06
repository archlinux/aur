# Maintainer: Dan Johansen <strit@strits.dk>

_pkgname=Integration
pkgname=desq-integration
pkgver=0.0.8
pkgrel=1
pkgdesc="Volume control for DesQ"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/${_pkgname}"
license=('GPL3')
depends=('qt5-base' 'libdesqui' 'dfl-settings' 'dfl-utils' 'dfl-applications' 'dfl-xdg' 'dfl-colorschemeparser')
makedepends=('meson' 'ninja')
source=("https://gitlab.com/DesQ/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('a75ec89d358c5eb2c1a03830cecd2fb7')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}

