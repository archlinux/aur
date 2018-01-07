# Contributor: snafu <snafu21@user.sourceforge.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=mandelbrot-gtk-git
pkgver=r56.fb1a4c6
pkgrel=1
pkgdesc="A multithreaded GTK3 application for rendering the mandelbrot and julia set."
arch=('i686' 'x86_64')
url="http://mandelbrot-gtk.sourceforge.net"
license=('GPL3')
depends=('gtk3')
makedepends=('git')
provides=('mandelbrot-gtk')
conflicts=('mandelbrot-gtk' 'mesa-demos')
source=("mandelbrot::git://git.code.sf.net/p/mandelbrot-gtk/code")
md5sums=('SKIP')
_gitname=mandelbrot

pkgver() {
  cd "$srcdir"/$_gitname
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir"/$_gitname
  make START=NO
}

package() {
  cd "$srcdir"/$_gitname
  make DESTDIR="$pkgdir" PREFIX=/usr install
} 
