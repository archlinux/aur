# Maintainer: Tal <talwat321@gmail.com>
pkgname=pap
pkgver="0.13.1"
pkgrel=1
pkgdesc='a swiss army knife for minecraft servers'
url='https://github.com/talwat/pap'
source=("$pkgname-$pkgver.tar.gz::https://github.com/talwat/pap/archive/v$pkgver.tar.gz")
arch=('any')
license=('MIT')
sha256sums=('03da5e916fbb0b51511c9cb71745871d8fc685f35c2814f91991fc2b8c439292')
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

