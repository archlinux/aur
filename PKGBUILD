# Maintainer: Tal <talwat321@gmail.com>
pkgname=pap
pkgver="0.13.3"
pkgrel=1
pkgdesc='a swiss army knife for minecraft servers'
url='https://github.com/talwat/pap'
source=("$pkgname-$pkgver.tar.gz::https://github.com/talwat/pap/archive/v$pkgver.tar.gz")
arch=('any')
license=('MIT')
sha256sums=('14923a1f86f809b0189719d7900173c46d257922d177567d17f14c149eac2430')
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

