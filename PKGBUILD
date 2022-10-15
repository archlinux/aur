# Maintainer: Dan Johansen <strit@manjaro.org>

_pkgname=color-utils
pkgname=dfl-color-utils
pkgver=0.1.0beta1
pkgrel=1
pkgdesc="A simple pure Qt/C++ implementation of the cylindrical color space model characterized by Hue-Chroma-Luma"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL3')
depends=('qt5-base')
makedepends=('meson' 'ninja')
source=("$url/-/archive/v${pkgver/beta1/-beta1}/${_pkgname}-v${pkgver/beta1/-beta1}.tar.gz")
md5sums=('1fbf61550dbef6918c31fb0ebc9573f4')

build() {
  cd "${_pkgname}-v${pkgver/beta1/-beta1}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver/beta1/-beta1}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
