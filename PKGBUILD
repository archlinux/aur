# Maintainer: Dan Johansen <strit@manjaro.org>

_pkgname=DesQTerm
pkgname=desq-apps-term
pkgver=0.0.7
pkgrel=1
pkgdesc="A simple terminal emulator for DesQ"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/DesQApps/${_pkgname}"
license=('GPL3')
depends=('qt5-base' 'qtermwidget' 'libdesqui' 'dfl-settings' 'dfl-utils' 'dfl-applications')
makedepends=('meson' 'ninja')
source=("https://gitlab.com/DesQ/DesQApps/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('f7338b94423a81fe8076bb968adda717')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
