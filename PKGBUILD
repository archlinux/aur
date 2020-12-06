# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=budgie-desktop-view
pkgver=1.0.2
pkgrel=1
pkgdesc="The official Budgie desktop icons application / implementation"
arch=('x86_64')
url="https://solus-project.com/budgie"
license=('APACHE')
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
md5sums=('a51c6e7de35ed2456f4482fef60c4b28')

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

