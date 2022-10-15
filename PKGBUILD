# Maintainer: Dan Johansen <strit@manjaro.org>

_pkgname=status-notifier
pkgname=dfl-status-notifier
pkgver=0.1.0beta1
pkgrel=1
pkgdesc="Implementation of the XDG Status Notification Specifications"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL3')
depends=('qt5-base')
makedepends=('meson' 'ninja')
source=("$url/-/archive/v${pkgver/beta1/-beta1}/${_pkgname}-v${pkgver/beta1/-beta1}.tar.gz")
md5sums=('27954211c2a54b9d73f25f876c94fe1d')

build() {
  cd "${_pkgname}-v${pkgver/beta1/-beta1}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver/beta1/-beta1}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
