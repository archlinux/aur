# Maintainer: Tal <talwat321@gmail.com>
pkgname=pap
pkgver="0.14.1"
pkgrel=1
pkgdesc='a swiss army knife for minecraft servers'
url='https://github.com/talwat/pap'
source=("$pkgname-$pkgver.tar.gz::https://github.com/talwat/pap/archive/v$pkgver.tar.gz")
arch=('any')
license=('MIT')
sha256sums=('b1bd3164730dcd497def78273ef703ded09eba72ce9f6a47dcc4b57fcdad2174')
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

