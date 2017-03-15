# Maintainer: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=ananicy-git
pkgver=1.8.r2.g6dd10bf
pkgrel=1
pkgdesc="Ananicy - is Another auto nice daemon, with community rules support"
arch=('any')
url="https://github.com/Nefelim4ag/Ananicy.git"
license=('GPL3')
depends=('systemd' 'bash' 'schedtool')
makedepends=('rsync' 'git')
source=("$pkgname"::'git://github.com/Nefelim4ag/Ananicy.git#branch=master')
md5sums=('SKIP')
install=$pkgname.install

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/${pkgname}/"
  make install PREFIX="$pkgdir"
  mkdir -p "$pkgdir/usr/"
  mv -v "$pkgdir/lib" "$pkgdir/usr/"
}
