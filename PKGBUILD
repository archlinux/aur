# Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>
# Contributor: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=ananicy-rules-git
_pkgname=ananicy
pkgver=2.2.1.r48.gb3b666a
pkgrel=1
pkgdesc="Rules for ananicy-cpp"
arch=('any')
url="https://github.com/Nefelim4ag/Ananicy.git"
license=('GPL3')
makedepends=('git' 'make')
source=("$_pkgname"::'git+https://github.com/Nefelim4ag/Ananicy.git#branch=master')
md5sums=('SKIP')
conflicts=(ananicy ananicy-git)
backup=( 'etc/ananicy.d/ananicy.conf' )

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/${_pkgname}/"
  make install PREFIX="$pkgdir"

  rm -r "$pkgdir/lib" "$pkgdir/usr"
}
