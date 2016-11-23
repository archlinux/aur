pkgname=gupnp-tools
pkgver=0.8.13
pkgrel=1
pkgdesc="GUPnP Tools are free replacements of Intel UPnP tools that use GUPnP"
arch=('i686' 'x86_64')
url="http://www.gupnp.org/"
license=('GPL')
groups=('gupnp')
depends=('gupnp-av>=0.5.5' 'gtk3' 'gnome-icon-theme>=2.20' 'desktop-file-utils' 'gssdp>=0.13.3' 'gupnp>=0.20.14' 'intltool')
makedepends=('gtk-doc' 'pkgconfig')
options=('!libtool')
source=("https://download.gnome.org/sources/gupnp-tools/0.8/gupnp-tools-$pkgver.tar.xz")
build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
}
package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install || return 1
}
md5sums=('212d85ebce89b32468b59e1164050d40')

