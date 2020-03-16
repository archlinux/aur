# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: Swift Geek
# Contributor: twa022 <twa022 at gmail dot com>
# Contributor: simo <simo@archlinux.org>

pkgname=python2-gtkglext
pkgver=1.1.0
pkgrel=8
pkgdesc='Python language bindings for GtkGLExt'
arch=('x86_64')
depends=('gtkglext' 'mesa' 'python2-opengl' 'pygtk' 'python')
makedepends=('libxmu')
url='https://projects.gnome.org/gtkglext/'
source=("https://downloads.sourceforge.net/gtkglext/pygtkglext-$pkgver.tar.bz2")
license=('LGPL')
md5sums=('720b421d3b8514a40189b285dd91de57')
sha512sums=('1b94725d7f93c3ff01a4c2df7986ec3503493a39e78187ed8b440f9609daaf33d801f24b27acef324ea671ec4d46ca1b8cec508f685aa8f70bbc17cbefb69ebd')

build() {
  cd "$srcdir/pygtkglext-$pkgver"
  PYTHON='/usr/bin/python2' ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/pygtkglext-$pkgver"
  make DESTDIR="$pkgdir" install
}
