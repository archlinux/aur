# Maintainer: Dan Johansen <strit@manjaro.org>

_pkgname=notification
pkgname=dfl-notification
pkgver=0.1.0
pkgrel=1
pkgdesc="Implementation of the XDG Desktop Notification Spec"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL3')
depends=('qt5-base')
makedepends=('meson' 'ninja')
source=("$url/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('1693118dc894eb46fb44580bc84fc538')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
