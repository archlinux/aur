# Maintainer: Dan Johansen <strit@manjaro.org>

_pkgname=wayqt
pkgname=dfl-wayqt
pkgver=0.1.0alpha2
pkgrel=1
pkgdesc="A Qt-based wrapper for various wayland protocols"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL3')
depends=('qt5-base' 'wayland-protocols' 'wlroots')
makedepends=('meson' 'ninja')
source=("$url/-/archive/v${pkgver/alpha2/-alpha2}/${_pkgname}-v${pkgver/alpha2/-alpha2}.tar.gz")
md5sums=('990447b2230bc6bef8048b52bf70b3c3')

build() {
  cd "${_pkgname}-v${pkgver/alpha2/-alpha2}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver/alpha2/-alpha2}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
