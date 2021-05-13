# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>
# Contributor: Mario Blättermann <mariobl@gnome.org>

pkgname=wmcliphist
pkgver=2.1
pkgrel=1 
pkgdesc="A clipboard history dockable application for Window Maker"
arch=('i686' 'x86_64')
url="https://www.dockapps.net/wmcliphist"
license=('GPL')
depends=('gtk3')
install=wmcliphist.install
source=(https://www.dockapps.net/download/wmcliphist-$pkgver.tar.gz)
md5sums=('a608fc3f9c9a9269e640dfac38500e6f')
build()  {
  cd "$srcdir/dockapps"
  make
}
package() {
  cd "$srcdir/dockapps"
  install -D -m 644 wmcliphistrc $pkgdir/etc/wmcliphistrc.sample
  install -D -m 755 wmcliphist $pkgdir/usr/bin/wmcliphist
}
