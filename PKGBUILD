# Maintainer: Dan Johansen <strit@manjaro.org>

_pkgname=xdg
pkgname=dfl-xdg
pkgver=0.1.0alpha1
pkgrel=1
pkgdesc="XDG Specifications implementation for Qt"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL3')
depends=('qt5-base')
makedepends=('meson' 'ninja')
source=("$url/-/archive/v${pkgver/alpha1/-alpha1}/${_pkgname}-v${pkgver/alpha1/-alpha1}.tar.gz")
md5sums=('e131eee481a99f3a7e89e36c95dd0162')

build() {
  cd "${_pkgname}-v${pkgver/alpha1/-alpha1}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver/alpha1/-alpha1}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
