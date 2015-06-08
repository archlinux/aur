# Maintainer: Cédric Bellegarde <gnumdk@gmail.com>

pkgname=lollypop
pkgver=0.9.20
pkgrel=1
pkgdesc="Music player for GNOME"
arch=(i686 x86_64)
license=('GPL')
url="https://github.com/gnumdk/lollypop"
depends=(python-dbus gtk3 python-gobject python-cairo gobject-introspection totem-plparser desktop-file-utils)
makedepends=(intltool itstool python)
install=lollypop.install
source=(https://github.com/gnumdk/lollypop/releases/download/$pkgver/$pkgname-$pkgver.tar.xz)

sha256sums=('bc12a4be7aa01783d30b1297bfe85ca271a7478338be97946c71187b440b6499')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --disable-schemas-compile
  make
}

package() {
  cd $pkgname-$pkgver
  make -j1 DESTDIR="${pkgdir}" install
}
