# Maintainer: David Birks <david@birks.dev>

pkgname=pluto
pkgver=3.1.1
pkgrel=1
pkgdesc='A cli tool to help discover deprecated apiVersions in Kubernetes'
arch=(x86_64)
url='https://github.com/FairwindsOps/pluto'
license=(Apache)
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FairwindsOps/pluto/archive/v$pkgver.tar.gz")
sha256sums=('2589c946aacb98c18c3348b69cf6b81141c379ca05890fdab5b828057129597b')

build() {
  cd $pkgname-$pkgver

  go get github.com/markbates/pkger/cmd/pkger

  export VERSION=$pkgver
  make build
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
