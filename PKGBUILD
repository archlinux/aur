# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=mpfc
pkgver=2.0
pkgrel=1
pkgdesc="A gstreamer-based audio player with curses interface."
arch=(i686 x86_64)
url="http://sourceforge.net/projects/mpfc/"
license=('GPL')
depends=('gst-plugins-base-libs' 'json-glib' 'taglib' 'gpm')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('c53702073827b3ec984a51ea6c03c7b0')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --enable-static=no
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
