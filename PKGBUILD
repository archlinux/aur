# Maintainer: Vladimir Panteleev <arch-pkg at thecybershadow.net>
_pkgname=evmapd
pkgname=$_pkgname-git
pkgver=r10.3920d17
pkgrel=1
pkgdesc="An input event remapping daemon for Linux"
arch=('i686' 'x86_64')
url="http://users.softlab.ntua.gr/~thkala/projects/evmapd/evmapd.html"
license=('GPL')
makedepends=()
depends=('libcfg+' 'glibc')
source=("git+https://github.com/thkala/evmapd")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"

  make prefix="$pkgdir/usr" install
}
