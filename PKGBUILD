# Maintainer: bitwave <aur [At] oomlu [dOt] de>
# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: rabyte <rabyte__gmail>

pkgname=fastdup
pkgver=0.3
pkgrel=3
pkgdesc="A tool to quickly find identical files within directory trees"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/fastdup/"
license=('GPL3')
depends=('gcc-libs')
source=(https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2)
sha256sums=('b7457826bd472768730cceebca722fd3d780d7b73c5f365d60727f59bdf47ac1')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make FLAGS="$CXXFLAGS"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
