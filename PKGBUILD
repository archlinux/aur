# Maintainer: Dan Johansen <strit@manjaro.org>

_pkgname=SNI
pkgname=desq-utils-sni
pkgver=0.0.7
pkgrel=1
pkgdesc="System tray for DesQ"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/DesQUtils/${_pkgname}"
license=('GPL3')
depends=('qt5-base' 'libdesqui' 'libdbusmenu-qt5' 'dfl-utils' 'dfl-applications' 'dfl-status-notifier' 'dfl-layouts' 'dfl-xdg' 'dfl-wayqt')
makedepends=('meson' 'ninja')
source=("https://gitlab.com/DesQ/DesQUtils/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('a1366126c589939f53563edb5069e5ca')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
