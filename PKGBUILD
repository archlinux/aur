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

sha256sums=('342a123095b86c2970519903f7e6bdddd9d1413c7220c501a8d177016fc6bbf3')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --disable-schemas-compile
  make
}

package() {
  cd $pkgname-$pkgver
  make -j1 DESTDIR="${pkgdir}" install
}
