# Maintainer: Cédric Bellegarde <gnumdk@gmail.com>

pkgname=lollypop
pkgver=0.9.30
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

sha256sums=('1002119ce8a6f658a550c00ccf2c715f0a2b5aa193d8aa071dd4a81224696961')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --disable-schemas-compile
  make
}

package() {
  cd $pkgname-$pkgver
  make -j1 DESTDIR="${pkgdir}" install
}
