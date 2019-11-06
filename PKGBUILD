# Maintainer: Andrew Whatson <whatson@gmail.com>
# Contributor: Jaume Delclòs <jaume@delclos.com>
# Contributor: Daniel Krueger <keenbug gmail.com>
# Contributor: Daniel Oliveira <psykond@gmail.com>
pkgname=guile-gnome-platform
pkgver=2.16.5
pkgrel=1
pkgdesc="Binding between Guile Scheme and the Gnome stack of libraries. (fe. Pango, GTK+, Cairo, GStreamer, Glade, GtkSourceView and else). To build wrappers for GTK+ and higher in the stack, you will first need Guile-Cairo."
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/guile-gnome/"
license=('GPL2')
depends=('g-wrap' 'guile-cairo' 'libgnomeui')
options=(!libtool)
source=("http://ftp.gnu.org/pub/gnu/guile-gnome/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('298d8c4f9b567bfe87beda18ed58d047c2e01b88c80895129de5466b921ccebe')

build() {
  cd $pkgname-$pkgver
  GUILE=/usr/bin/guile ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}
