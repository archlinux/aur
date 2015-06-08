pkgname=gupnp-tools
pkgver=0.8.10
pkgrel=1
pkgdesc="GUPnP Tools are free replacements of Intel UPnP tools that use GUPnP"
arch=('i686' 'x86_64')
url="http://www.gupnp.org/"
license=('GPL')
groups=('gupnp')
depends=('gupnp-av>=0.5.1' 'gtk3' 'gnome-icon-theme>=2.20' 'desktop-file-utils' 'gssdp>=0.7' 'gupnp>=0.13' 'intltool')
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
md5sums=('ad8423d036e98bc6f877528d6b846f6a')

