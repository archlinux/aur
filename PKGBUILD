# Maintainer: Denis Kasak <dkasak|AT|termina.org.uk>
# Contributor: Hilton Medeiros <medeiros.hilton at gmail tod com>
# Contributor: Tony Dodd <arch@recalcitrance.net>
# Contributor: Mark Taylor <skymt0@gmail.com>

pkgname=contextfree
pkgver=3.1
pkgrel=1
pkgdesc="A program that generates images from written instructions called a grammar"
arch=('i686' 'x86_64')
url="https://www.contextfreeart.org/"
license=('GPL2')
depends=('libpng' 'gcc-libs')
makedepends=('bison' 'flex')
source=("https://www.contextfreeart.org/download/ContextFreeSource${pkgver}.tgz")
sha256sums=('b5a0662c904c1369116a3cc9ab76d20eef8d21eb4caf47ec1b989c2cd40e315a')


build() {
  # NOTE: 3.1 tarball packages files directly in the root of the archive
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
