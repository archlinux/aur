# Maintainer: Cédric Bellegarde <gnumdk@gmail.com>

pkgname=lollypop
pkgver=0.9.32
pkgrel=1
pkgdesc="Music player for GNOME"
arch=(i686 x86_64)
license=('GPL')
url="https://github.com/gnumdk/lollypop"
depends=(python-dbus gtk3 python-gobject python-cairo gobject-introspection totem-plparser desktop-file-utils)
makedepends=(intltool itstool python)
optdepends=('python-pylast: last.fm support') 
install=lollypop.install
source=(https://github.com/gnumdk/lollypop/releases/download/$pkgver/$pkgname-$pkgver.tar.xz)

sha256sums=('c23b2b24f8f899d2c91c4890d5744a38b3fcfac5e9cf7777c5dafa8e129fdd2e')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --disable-schemas-compile
  make
}

package() {
  cd $pkgname-$pkgver
  make -j1 DESTDIR="${pkgdir}" install
}
