# Maintainer: Dan Johansen <strit@manjaro.org>

_pkgname=notification
pkgname=dfl-notification
pkgver=0.1.0beta1
pkgrel=1
pkgdesc="Implementation of the XDG Desktop Notification Spec"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL3')
depends=('qt5-base')
makedepends=('meson' 'ninja')
source=("$url/-/archive/v${pkgver/beta1/-beta1}/${_pkgname}-v${pkgver/beta1/-beta1}.tar.gz")
md5sums=('6ae0ae7bdb03e200ef81e6d1c87dfe5f')

build() {
  cd "${_pkgname}-v${pkgver/beta1/-beta1}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver/beta1/-beta1}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
