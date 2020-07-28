# Maintainer: David Birks <david@birks.dev>

pkgname=pluto
pkgver=3.4.0
pkgrel=1
pkgdesc='A cli tool to help discover deprecated apiVersions in Kubernetes'
arch=(x86_64)
url='https://github.com/FairwindsOps/pluto'
license=(Apache)
makedepends=('go' 'pkger')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FairwindsOps/pluto/archive/v$pkgver.tar.gz")
sha256sums=('60181666953f1b84e240638bb625fffc5ce6eb09122c1ee4c37d4910a1badfdc')

build() {
  cd $pkgname-$pkgver

  export VERSION=$pkgver
  make build
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
