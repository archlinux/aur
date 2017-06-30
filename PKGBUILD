# Maintainer: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname=screenshot-applet
pkgver=0.4.2
pkgrel=0.1
pkgdesc="A Budgie applet for taking and uploading screenshots to Imgur and Imagebin."
arch=('i686' 'x86_64')
license=('GPL2')
md5sums=('8e6f97a5a4c37e81f2076328e6f84820')
depends=('libpeas' 'budgie-desktop'  'json-glib' 'rest' 'gnome-screenshot')
makedepends=('unzip' 'gnome-common' 'gobject-introspection' 'intltool' 'meson' 'ninja' 'itstool' 'vala' 'yelp-tools')
source=(https://github.com/cybre/screenshot-applet/archive/${pkgver}.zip)
url="https://github.com/cybre/${pkgname}"

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
