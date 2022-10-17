# Maintainer: Dan Johansen <strit@manjaro.org>

_pkgname=DesQDocs
pkgname=desq-apps-docs
pkgver=0.0.7
pkgrel=1
pkgdesc="A simple Document Viewer for DesQ"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/DesQApps/${_pkgname}"
license=('GPL3')
depends=('qt5-base' 'poppler-qt5' 'qdocumentview' 'libdesqui' 'dfl-applications' 'dfl-settings' 'dfl-utils')
makedepends=('meson' 'ninja')
source=("https://gitlab.com/DesQ/DesQApps/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('cd332b360457dcb81e33272b684560a8')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
