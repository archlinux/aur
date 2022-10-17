# Maintainer: Dan Johansen <strit@manjaro.org>

_pkgname=PowerManager
pkgname=desq-utils-powermanager
pkgver=0.0.7
pkgrel=1
pkgdesc="Power manager for DesQ"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/DesQUtils/${_pkgname}"
license=('GPL3')
depends=('qt5-base' 'libdesq' 'dfl-wayqt' 'dfl-settings' 'dfl-login1' 'dfl-power' 'dfl-utils' 'dfl-applications')
makedepends=('meson' 'ninja')
source=("https://gitlab.com/DesQ/DesQUtils/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('caee69340034c35f8bde1dbf2db19b22')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
