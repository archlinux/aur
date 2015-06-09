# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=eflete
pkgver=0.4.1
pkgrel=1
pkgdesc="EFL Edje Theme Editor - a theme graphical editor"
arch=('i686' 'x86_64')
url="https://phab.enlightenment.org/w/projects/eflete/"
license=('GPL2')
depends=('efl' 'elementary' 'ewe' 'enventor-git')
makedepends=('git')
source=("git://git.enlightenment.org/devs/rimmed/eflete.git#tag=${pkgver}")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}
