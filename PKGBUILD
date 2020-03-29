# Contributor: snafu <snafu21@user.sourceforge.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=mandelbrot-gtk-git
pkgver=0.5.r3.g4e29df8
pkgrel=1
epoch=1
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

pkgver() {
  cd ${pkgname%-gtk-git}
  git describe --tags | cut -c2- | sed 's+-+.r+' | tr - .
}

build() {
  cd ${pkgname%-gtk-git}
  make START=NO
}

package() {
  cd ${pkgname%-gtk-git}
  make DESTDIR="$pkgdir" PREFIX=/usr install
} 
