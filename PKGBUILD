# Maintainer: David Birks <david@birks.dev>

pkgname=pluto
pkgver=3.0.0
pkgrel=1
pkgdesc='A cli tool to help discover deprecated apiVersions in Kubernetes'
arch=(x86_64)
url='https://github.com/FairwindsOps/pluto'
license=(Apache)
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FairwindsOps/pluto/archive/v$pkgver.tar.gz")
sha256sums=('c8548e29d337c67d26067714ed7ee7a20ec3701f59073912201e68bdaa77654b')

build() {
  cd $pkgname-$pkgver

  go get github.com/markbates/pkger/cmd/pkger

  export VERSION=$pkgver
  make build
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
