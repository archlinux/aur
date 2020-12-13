# Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>
_binaryname=ethr
pkgname=$_binaryname-git
pkgver=v1.0.0.r0.gaa63660
pkgrel=1
pkgdesc="Ethr is a Network Performance Measurement Tool for TCP, UDP & HTTP"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/Microsoft/ethr"
license=('MIT')
makedepends=(
  'go'
  'git'
)
source=("${pkgname}::git+https://github.com/Microsoft/ethr.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"

  # Build
  go build
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 "$_binaryname" "$pkgdir/usr/bin/ethr"
}
