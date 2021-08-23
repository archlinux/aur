# Maintainer: Dr-Noob <peibolms at gmail dot com>
# Contributor: Dr-Noob <peibolms at gmail dot com>
_name=gpufetch
pkgname="$_name-git"
pkgver=0.10.r0.gf4a96ce
pkgrel=1
pkgdesc="Simple yet fancy GPU architecture fetching tool"
arch=('x86_64')
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
url="https://github.com/Dr-Noob/gpufetch"
license=('MIT')
depends=('glibc' 'cuda')
makedepends=('git' 'make' 'cuda-tools')
source=("git+https://github.com/Dr-Noob/gpufetch")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_name"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_name"
  make
}

package() {
  cd "$srcdir/$_name"
  make DESTDIR="$pkgdir/" install
}
