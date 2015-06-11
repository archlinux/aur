# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=wmmand
pkgver=1.3.2
pkgrel=1
pkgdesc="Mandelbrot set browser docapp for Window Maker"
arch=('i686' 'x86_64')
url="http://github.com/ciotog/wmMand"
license=('GPL')
depends=('libxpm')
makedepends=('git')
source=("$pkgname::git+https://github.com/ciotog/wmMand.git")
md5sums=('SKIP')

prepare() {
  cd $pkgname/wmMand
  gunzip wmMand.6.gz
}

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname/wmMand
  install -Dm0755 wmMand "$pkgdir/usr/bin/wmMand"
  install -Dm0644 wmMand.6 "$pkgdir/usr/share/man/man6/wmMand.6"
  install -Dm0644 wmMand.png "$pkgdir/usr/share/pixmaps/wmMand.png"
}

