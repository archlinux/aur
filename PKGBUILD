# Maintainer: Tal <talwat321@gmail.com>
pkgname=pap
pkgver="0.13.2"
pkgrel=1
pkgdesc='a swiss army knife for minecraft servers'
url='https://github.com/talwat/pap'
source=("$pkgname-$pkgver.tar.gz::https://github.com/talwat/pap/archive/v$pkgver.tar.gz")
arch=('any')
license=('MIT')
sha256sums=('6e30ada8a204c41e5b39a514a3cfcf5195e61976360a29069c4e46ae26d5cd26')
makedepends=('go>=1.18')
optdepends=('java-runtime: running the downloaded jarfiles')

build () {
  cd "$pkgname-$pkgver"

  export GOFLAGS="-trimpath"
  make
}

package() {
  cd "$pkgname-$pkgver"

  make install PREFIX="$pkgdir/usr"
}

