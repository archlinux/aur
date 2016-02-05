# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
_pkgname=folve
pkgname=$_pkgname-git
pkgver=0.r294.01cb0d5
pkgrel=1
pkgdesc="seamlessly FIR convolving audio file fuse filesystem with gapless support"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/hzeller/folve"
license=('GPL')
depends=('fuse' 'libmicrohttpd' 'libsndfile' 'zita-convolver')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  mkdir -p "$pkgdir/usr/bin"
  make PREFIX="$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et:
