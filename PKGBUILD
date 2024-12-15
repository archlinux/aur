# Maintainer: Ramana Kumar <firstname|@|member.fsf.org>
# Contributor: Lars Hupel <lars@hupel.info>
pkgname=opentheory
epoch=1
pkgver=1.4.20230321
pkgrel=1
pkgdesc="a tool for processing higher-order logic theory packages"
arch=('i686' 'x86_64')
url="http://www.gilith.com/software/opentheory"
license=('MIT')
groups=()
depends=(gmp)
makedepends=(mlton)
source=("https://github.com/gilith/$pkgname/releases/download/v$pkgver/$pkgname.tar.gz")
sha256sums=('666651c7ce8447644c17090a26d3abce27c06d89e8c1e6d1f9bd03e47f1d4a75')

build() {
  cd "$srcdir/$pkgname"
  make mlton
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp -p "$srcdir/$pkgname/bin/mlton/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname/doc/MIT-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/license"
}

# vim:set ts=2 sw=2 et:
