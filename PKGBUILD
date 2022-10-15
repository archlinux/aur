# Maintainer: Dan Johansen <strit@manjaro.org>

_pkgname=layouts
pkgname=dfl-layouts
pkgver=0.1.0beta1
pkgrel=1
pkgdesc="Special layouts, ex, Dynamic Layout, Circular Layout etc"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL3')
depends=('qt5-base')
makedepends=('meson' 'ninja')
source=("$url/-/archive/v${pkgver/beta1/-beta1}/${_pkgname}-v${pkgver/beta1/-beta1}.tar.gz")
md5sums=('94265573cfd9981aa54fd33eb91f16a7')

build() {
  cd "${_pkgname}-v${pkgver/beta1/-beta1}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver/beta1/-beta1}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
