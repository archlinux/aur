# Maintainer: Morten Linderud <morten@linderud.pw>
# Contributor: Andreas Krinke <andreas dot krinke at gmx dot de>
pkgname=gephi
pkgver=0.9.0
pkgrel=2
pkgdesc="An interactive graph visualization and exploration platform"
arch=('i686' 'x86_64')
url="http://gephi.org"
license=('CDDL' 'GPL3')
depends=('java-runtime' 'libxxf86vm' 'jdk8-openjdk')
makedepends=()
options=(!strip)
source=("https://github.com/gephi/gephi/releases/download/v0.9.0/gephi-0.9.0-linux.tar.gz")
sha256sums=('8e5e3289de31b31d736fb1f23c318d168ae18c2aa835b357375e259c6e2c8e8f')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p "$pkgdir/opt/$pkgname"
  cp -r * "$pkgdir/opt/$pkgname"
  chmod -R 755 "$pkgdir/opt/$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/bin/gephi" "$pkgdir/usr/bin"
}
