# Maintainer: Ramana Kumar <firstname|@|member.fsf.org>
# Contributor: Lars Hupel <lars@hupel.info>
pkgname=opentheory
epoch=1
pkgver=1.4.20180810
pkgrel=1
pkgdesc="a tool for processing higher-order logic theory packages"
arch=('i686' 'x86_64')
url="http://www.gilith.com/software/opentheory"
license=('MIT')
groups=()
depends=(gmp)
makedepends=(mlton)
source=("https://github.com/gilith/$pkgname/releases/download/v$pkgver/$pkgname.tar.gz")
sha256sums=('1b939736fd2acf543db454fe1fc29cb6759c0bc3b5ccf6c4fbff9d20a05f9088')

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
