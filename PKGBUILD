# Maintainer: Jed Liu <liujed@users.noreply.github.com>
pkgname='plasma-potd-windows-spotlight'
pkgver='0.0.0'
pkgrel=1
pkgdesc="POTD provider using Windows 11's Spotlight API for daily high-resolution wallpaper"
arch=('x86_64')
url='https://github.com/liujed/${pkgname}'
license=('GPL-2.0-or-later')
depends=('kdeplasma-addons')
makedepends=(
  'extra-cmake-modules'
  'git'
)
source=(
  "git+https://github.com/liujed/${pkgname}#tag=v${pkgver}?signed"
)
validpgpkeys=(
  # Jed Liu <liujed@users.noreply.github.com>
  B7505955F1CF93F83656A95D9A00B50131DEAC06
)

prepare() {
  cd "${srcdir}/${pkgname}"
  mkdir -p build
}

build() {
  cd "${srcdir}/${pkgname}/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "${srcdir}/${pkgname}/build"
  make DESTDIR="${pkgdir}" install
}

b2sums=('d76c05491fa4008dddefb3d8a2abdc4e389598a6328dc32efae588c25d053657fe90e0c4c155596771a5a35f7cc36abfde377465ff9de2fd2b4e7bd5fe28f662')
