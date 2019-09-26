pkgname=genpkgbuild-go
_pkgname=genpkgbuild-go
pkgver=0.0.2
pkgrel=1
license=('GPL')
arch=('x86_64')
url='https://github.com/acomagu/genpkgbuild-go'
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
depends=()
makedepends=('go')
sha1sums=('SKIP')

build(){
  cd "$pkgname-$pkgver"
  CGO_ENABLED=0 GO111MODULE=on go build -o genpkgbuild-go .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 genpkgbuild-go "$pkgdir/usr/bin/genpkgbuild-go"
}
