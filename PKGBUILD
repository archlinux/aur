# Maintainer: Marius Nestor <marius at softpedia dot com>

pkgname=gnome-directory-thumbnailer
pkgver=0.1.6
pkgrel=1
pkgdesc="A GNOME thumbnailer utility that will generate a thumbnail for a directory"
arch=('any')
url="https://wiki.gnome.org/GnomeDirectoryThumbnailer"
license=('LGPL2.1')
depends=('gnome-desktop')
makedepends=('glib2' 'gdk-pixbuf2' 'glib2')
source=(http://ftp.acc.umu.se/pub/GNOME/sources/gnome-directory-thumbnailer/0.1/$pkgname-$pkgver.tar.xz)
md5sums=('dac98a3becbc71015a927fa3a1621038')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}
package() {
  install -D -m644 "$srcdir"/$pkgname-$pkgver/src/gnome-directory-thumbnailer.thumbnailer "$pkgdir"/usr/share/thumbnailers/gnome-directory-thumbnailer.thumbnailer
}
