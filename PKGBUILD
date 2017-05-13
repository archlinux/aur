# Contributor: snafu <snafu21@user.sourceforge.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=mandelbrot-gtk-git
pkgver=0.4.9.g3771afb
pkgrel=1
pkgdesc="A multithreaded GTK3 application for rendering the mandelbrot and julia set."
arch=('i686' 'x86_64')
url="http://mandelbrot-gtk.sourceforge.net"
license=('GPL3')
depends=('gtk3')
makedepends=('git')
provides=('mandelbrot-gtk')
conflicts=('mandelbrot-gtk')
source=("mandelbrot::git://git.code.sf.net/p/mandelbrot-gtk/code")
md5sums=('SKIP')
_gitname=mandelbrot

pkgver() {
  cd "$srcdir"/$_gitname
  git describe --tags | sed s+-+.+g | cut -c2-
}

build() {
  cd "$srcdir"/$_gitname
  make DEBUG=NO START=NO
}

package() {
  cd "$srcdir"/$_gitname
  make DEBUG=NO DESTDIR="$pkgdir" PREFIX=/usr  install
} 
