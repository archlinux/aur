# Maintainer: Dan Johansen <strit@manjaro.org>

_pkgname=Runner
pkgname=desq-utils-runner
pkgver=0.0.7
pkgrel=1
pkgdesc="A simple app launcher for DesQ"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/DesQUtils/${_pkgname}"
license=('GPL3')
depends=('qt5-base' 'libdesq' 'dfl-settings' 'dfl-wayqt')
makedepends=('meson' 'ninja')
source=("https://gitlab.com/DesQ/DesQUtils/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('42bb50ded5e4d9a152ff0f1a9613df93')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
