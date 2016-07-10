# Maintainer: Jaume Delclòs <jaume@delclos.com>
# Contributor: Daniel Krueger <keenbug gmail.com>
# Contributor: Daniel Oliveira <psykond@gmail.com>
pkgname=guile-gnome-platform
pkgver=2.16.4
pkgrel=1
pkgdesc="Binding between Guile Scheme and the Gnome stack of libraries. (fe. Pango, GTK+, Cairo, GStreamer, Glade, GtkSourceView and else). To build wrappers for GTK+ and higher in the stack, you will first need Guile-Cairo."
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/guile-gnome/"
license=('GPL2')
depends=('g-wrap' 'guile-cairo' 'libgnomeui')
provides=($pkgname)
conflicts=($pkgname)
options=(!libtool)
source=("http://ftp.gnu.org/pub/gnu/guile-gnome/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('930178554957a25209c6ca0adeb3a584')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}
