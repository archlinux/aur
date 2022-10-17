# Maintainer: Dan Johansen <strit@manjaro.org>

_pkgname=inotify
pkgname=dfl-inotify
pkgver=0.1.0
pkgrel=1
pkgdesc="A Qt wrapper around inotify"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL3')
depends=('qt5-base')
makedepends=('meson' 'ninja')
source=("$url/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('15168f9b908351ed11b9994e5d381f53')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
