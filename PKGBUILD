# Maintainer: Dan Johansen <strit@manjaro.org>

_pkgname=Notifier
pkgname=desq-utils-notifier
pkgver=0.0.7
pkgrel=1
pkgdesc="Notification daemon for DesQ"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/DesQUtils/${_pkgname}"
license=('GPL3')
depends=('qt5-base' 'libdesq' 'qt5-svg' 'dfl-settings' 'dfl-utils' 'dfl-notification' 'dfl-xdg' 'dfl-wayqt')
makedepends=('meson' 'ninja')
source=("https://gitlab.com/DesQ/DesQUtils/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('c4aa82363c82b4b4b3ab321849f2edc8')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
