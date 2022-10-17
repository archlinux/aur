# Maintainer: Dan Johansen <strit@manjaro.org>

_pkgname=status-notifier
pkgname=dfl-status-notifier
pkgver=0.1.0
pkgrel=1
pkgdesc="Implementation of the XDG Status Notification Specifications"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL3')
depends=('qt5-base')
makedepends=('meson' 'ninja')
source=("$url/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('dbb9c92af8f8ce06dbdadad99c443565')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
