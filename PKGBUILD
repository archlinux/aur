# Maintainer: Cédric Bellegarde <gnumdk@gmail.com>

pkgname=lollypop
pkgver=0.9.31
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

sha256sums=('bef1d0e87ac941dc471d8a1e658feb3254f1e76da4b69f8cbe754aa8bcdb9c79')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --disable-schemas-compile
  make
}

package() {
  cd $pkgname-$pkgver
  make -j1 DESTDIR="${pkgdir}" install
}
