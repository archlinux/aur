# Maintainer: Dan Johansen <strit@strits.dk>

_pkgname=SNI
pkgname=desq-utils-sni
pkgver=0.0.8
pkgrel=1
pkgdesc="System tray for DesQ"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/DesQUtils/${_pkgname}"
license=('GPL3')
depends=('qt5-base' 'libdesqui' 'libdbusmenu-qt5' 'dfl-utils' 'dfl-applications' 'dfl-status-notifier' 'dfl-layouts' 'dfl-xdg' 'dfl-wayqt')
makedepends=('meson' 'ninja')
source=("https://gitlab.com/DesQ/DesQUtils/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('39d534a4cd964388dfef831f6a1f6776')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
