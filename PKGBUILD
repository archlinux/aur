# Maintainer: Denis Kasak <dkasak|AT|termina.org.uk>
# Contributor: Hilton Medeiros <medeiros.hilton at gmail tod com>
# Contributor: Tony Dodd <arch@recalcitrance.net>
# Contributor: Mark Taylor <skymt0@gmail.com>

pkgname=contextfree
pkgver=3.0.11.3
pkgrel=1
pkgdesc="A program that generates images from written instructions called a grammar"
arch=('i686' 'x86_64')
url="https://www.contextfreeart.org/"
license=('GPL2')
depends=('libpng' 'gcc-libs')
makedepends=('bison' 'flex')
source=("https://www.contextfreeart.org/download/ContextFreeSource${pkgver}.tgz")
md5sums=('e377f99023a1dff07673b4462d9639b2')



build() {
  # NOTE: 3.0.11.3 tarball packages files directly in the root of the archive
  # instead of under a directory.
  # cd "$srcdir/context-free-$pkgver"
  cd "$srcdir"

  make
}

package() {
  # NOTE: Same as above.
  # cd "$srcdir/context-free-$pkgver"
  cd "$srcdir"

  install -Dm755 cfdg "$pkgdir/usr/bin/cfdg"
  install -d "$pkgdir/usr/share/$pkgname"
  cp -r input "$pkgdir/usr/share/$pkgname/examples"
}
