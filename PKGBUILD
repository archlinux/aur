# Maintainer: Morten Linderud <morten@linderud.pw>
# Contributor: Andreas Krinke <andreas dot krinke at gmx dot de>
pkgname=gephi
pkgver=0.9.1
pkgrel=3
pkgdesc="An interactive graph visualization and exploration platform"
arch=('i686' 'x86_64')
url="http://gephi.org"
license=('CDDL' 'GPL3')
depends=('java-runtime' 'libxxf86vm' 'jdk8-openjdk')
makedepends=()
options=(!strip)
source=("https://github.com/gephi/gephi/releases/download/v$pkgver/gephi-$pkgver-linux.tar.gz")
sha256sums=('f1d54157302df05a53b94e1518880c949c43ba4ab21e52d57f3edcbdaa06c7ee')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p "$pkgdir/opt/$pkgname"
  cp -r * "$pkgdir/opt/$pkgname"
  chmod -R 755 "$pkgdir/opt/$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/bin/gephi" "$pkgdir/usr/bin"
}
