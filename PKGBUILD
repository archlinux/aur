# Maintainer: Dan Johansen <strit@manjaro.org>

_pkgname=storage
pkgname=dfl-storage
pkgver=0.1.0
pkgrel=1
pkgdesc="A class that extends QApplications"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL3')
depends=('qt5-base')
makedepends=('meson' 'ninja')
source=("$url/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('0a43557ba4270b5ff785ebee14a19610')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
