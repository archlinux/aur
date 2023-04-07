# Maintainer: Tal <talwat321@gmail.com>
pkgname=pap
pkgver="0.14.3"
pkgrel=1
pkgdesc='a swiss army knife for minecraft servers'
url='https://github.com/talwat/pap'
source=("$pkgname-$pkgver.tar.gz::https://github.com/talwat/pap/archive/v$pkgver.tar.gz")
arch=('any')
license=('MIT')
sha256sums=('9902237abed6a103cfecd5798c108c6ebc0a4f9371ba76b6e464b20829517a57')
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

