# Maintainer: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=linadblock-git
pkgver=0.2.r0.ge113c07
pkgrel=1
pkgdesc="linadblock ad blocker uses hosts"
arch=('any')
url="https://github.com/Nefelim4ag/linadblock.git"
license=('GPL3')
depends=('systemd' 'bash')
makedepends=('git')
source=("$pkgname"::'git://github.com/Nefelim4ag/linadblock.git#branch=master')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/${pkgname}/"
  ./install.sh PREFIX="$pkgdir"
}
