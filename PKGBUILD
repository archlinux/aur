# Maintainer: Mike Sampson <mike@sambodata.com>
# Contributor: Sebastien Duquette <ekse.0x@gmail.com>
pkgname=libdisasm
pkgver=0.23
pkgrel=2
pkgdesc="a disassembler library."
arch=('i686' 'x86_64')
url="http://bastard.sourceforge.net/libdisasm.html"
license=('custom')
depends=()
source=("http://downloads.sourceforge.net/project/bastard/libdisasm/0.23/$pkgname-$pkgver.tar.gz")
md5sums=('fc813fae8fceca92c2e40dac1da69041')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/license.txt"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
