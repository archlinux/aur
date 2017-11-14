# Maintainer: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname=budgie-screenshot-applet
pkgver=0.4.3
pkgrel=0.1
pkgdesc="A Budgie applet for taking and uploading screenshots to Imgur and Imagebin."
arch=('i686' 'x86_64')
license=('GPL2')
sha256sums=('0a39cd01a76aaa825caccd62a46833163e113098f359074171eb134a27c7b67b')
depends=('libpeas' 'budgie-desktop'  'json-glib' 'rest')
makedepends=('gnome-common' 'gobject-introspection' 'intltool' 'meson' 'ninja' 'itstool' 'vala' 'yelp-tools')
url="https://github.com/cybre/${pkgname}"
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
