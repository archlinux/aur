# Maintainer: Dan Johansen <strit@manjaro.org>

_pkgname=Keyring
pkgname=desq-utils-keyring
pkgver=0.0.7
pkgrel=1
pkgdesc="DesQ Polkit Agent"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/DesQUtils/${_pkgname}"
license=('GPL3')
depends=('qt5-base' 'libdesqui' 'polkit-qt5' 'dfl-wayqt' 'dfl-settings')
makedepends=('meson' 'ninja')
source=("https://gitlab.com/DesQ/DesQUtils/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('40f623445762fa49893749314cad014c')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
