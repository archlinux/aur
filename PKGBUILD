# Maintainer: KeyLo99 <keylo99official@gmail.com>

_pkg=god
pkgname=god-git
pkgdesc="Utility for simplifying the Git usage"
pkgver=1.2
pkgrel=1
arch=('any')
url="https://github.com/KeyLo99/god"
license=('GPL3')
depends=('git')
makedepends=('go>=1.7')
source=('git://github.com/KeyLo99/god.git')
sha256sums=('SKIP')

build() {
  cd $_pkg
  go get -d ./...
  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    -o $_pkg .
}

package() {
  cd $_pkg
  install -Dm755 $_pkg $pkgdir/usr/local/bin/$_pkg
}