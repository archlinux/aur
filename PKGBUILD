# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ewe
pkgver=0.2.2
pkgrel=1
pkgdesc="Elementary widgets extension, desktop widget library"
arch=('i686' 'x86_64')
url="http://git.enlightenment.org/devs/rimmed/ewe.git/"
license=('GPL2')
depends=('efl' 'elementary')
makedepends=('git')
source=("git://git.enlightenment.org/devs/rimmed/ewe.git#tag=${pkgver}")
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
