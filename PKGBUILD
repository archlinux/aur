# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=budgie-desktop-view
pkgver=1.1.1
pkgrel=1
pkgdesc="The official Budgie desktop icons application / implementation"
arch=('x86_64')
url="https://solus-project.com/budgie"
license=('Apache 2.0')
depends=(
budgie-desktop
)
makedepends=(
meson
git
gobject-introspection
intltool
vala
gtk-doc
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/getsolus/budgie-desktop-view/archive/v${pkgver}.tar.gz")
sha256sums=('c3c5c3d1aec117bd32c860640ad3a34acee93fb35698712aa3d3f66c841c03f5')

prepare(){
  cd budgie-desktop-view-${pkgver}
  meson --prefix=/usr --sysconfdir=/etc build
}

build() {
  cd budgie-desktop-view-${pkgver}
  ninja -C build
}

package() {
  cd budgie-desktop-view-${pkgver}
  DESTDIR="${pkgdir}" ninja -C build install
}

