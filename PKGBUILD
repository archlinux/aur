# Maintainer: superlex

# Based on Parabola PKGBUILD:
# https://projects.parabola.nu/abslibre.git/tree/libre/librsvg-stable/PKGBUILD
# Maintainer (Arch): Jan de Groot <jgc@archlinux.org>

_pkgname=librsvg
pkgname=librsvg-stable
pkgver=2.40.10
pkgrel=1
epoch=2
pkgdesc="A SVG viewing library (stable version)"
arch=(i686 x86_64)
license=('LGPL')
depends=('gdk-pixbuf2' 'pango' 'libcroco')
makedepends=('intltool' 'gobject-introspection' 'vala' 'python2')
conflicts=($_pkgname)
provides=($_pkgname)
options=('!emptydirs')
url="https://live.gnome.org/LibRsvg"
install=librsvg.install
source=(https://download.gnome.org/sources/$_pkgname/${pkgver:0:4}/$_pkgname-$pkgver.tar.xz)
sha256sums=('965c807438ce90b204e930ff80c92eba1606a2f6fd5ccfd09335c99896dd3479')

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr --disable-static --enable-vala
  make
}
 
package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
