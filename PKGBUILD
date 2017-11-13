# Maintainer: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname=budgie-haste-applet
pkgver=0.3.0
pkgrel=0.1
pkgdesc="A Budgie applet for the haste service."
arch=('i686' 'x86_64')
license=('GPL2')
url="https://github.com/cybre/${pkgname}"
sha256sums=('69edb1efb700b1f5fd86b0e2e27a18261b375af85a46075c41dc41eab2a37494')
depends=('libpeas' 'budgie-desktop' 'libsoup')
makedepends=('gnome-common' 'intltool' 'itstool' 'vala' 'yelp-tools')
source=("${url}/archive/${pkgver}.tar.gz")


prepare() {
  cd "${srcdir}/budgie-${pkgname}-${pkgver}"
  mkdir -p build
  cd "${srcdir}/budgie-${pkgname}-${pkgver}/build"
  meson --prefix /usr --buildtype=plain ..
  ninja
}

package() {
  cd "${srcdir}/budgie-${pkgname}-${pkgver}/build"
  DESTDIR="${pkgdir}" ninja install
}