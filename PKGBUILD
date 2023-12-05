# Maintainer: Dan Johansen <strit@strits.dk>

_pkgname=Notifier
pkgname=desq-utils-notifier
pkgver=0.0.8
pkgrel=1
pkgdesc="Notification daemon for DesQ"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/DesQUtils/${_pkgname}"
license=('GPL3')
depends=('qt5-base' 'libdesq' 'qt5-svg' 'dfl-settings' 'dfl-utils' 'dfl-notification' 'dfl-xdg' 'dfl-wayqt')
makedepends=('meson' 'ninja')
source=("https://gitlab.com/DesQ/DesQUtils/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('3888347860d14eda40ea87ce69e40cbf')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
