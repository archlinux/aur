# Maintainer: jgmdev <jgmdev at gmail dot com>
# Maintainer: redtide <redtid3 at gmail dot com>
# Maintainer: Antonio O. <antonio.mx.9605 at gmail dot com>

_prjname=wxFormBuilder
pkgname=wxformbuilder
pkgver=4.2.1
pkgrel=1
pkgdesc="RAD tool for wxWidgets GUI design"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/wxFormBuilder/wxFormBuilder"
license=('GPL2')
provides=('wxformbuilder')
conflicts=('wxformbuilder' 'wxformbuilder-svn' 'wxformbuilder-git')
depends=('wxwidgets-gtk3' 'boost')
makedepends=('cmake')
source=(
  "https://github.com/wxFormBuilder/wxFormBuilder/releases/download/v${pkgver}/wxFormBuilder-${pkgver}-source-full.tar.gz"
)
sha512sums=(
  "d055f7cb2a90c8cb91370ffc38275b452de2975b0d834a040a6b0f2b733af8d9a7160a3c115d8c90ee7958be642345436e4546307970f22219bce5ca1b007a09"
)

build() {
  cd "${_prjname}-${pkgver}"
  cmake -S . -B _build --install-prefix /usr -DCMAKE_BUILD_TYPE=Release
  cmake --build _build --config Release
}
package() {
  cd "${_prjname}-${pkgver}"
  DESTDIR="${pkgdir}" cmake --install _build --config Release
}
