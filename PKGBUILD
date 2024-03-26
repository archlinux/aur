# Maintainer: jgmdev <jgmdev at gmail dot com>
# Maintainer: redtide <redtid3 at gmail dot com>
# Maintainer: Antonio O. <antonio.mx.9605 at gmail dot com>

_prjname=wxFormBuilder
pkgname=wxformbuilder
pkgver=4.1.0
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
  "d3b8fd8fe5cfafc2a3f49255d87aa78399be0804d6176d506ecfa77d141b86f1fda7150637c80a740637516807be3ae6f1d698825de8f247c7878b313d259d5f"
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
