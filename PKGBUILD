# Maintainer: David Birks <david@birks.dev>

pkgname=pluto
pkgver=2.3.0
pkgrel=1
pkgdesc='A cli tool to help discover deprecated apiVersions in Kubernetes'
arch=(x86_64)
url='https://github.com/FairwindsOps/pluto'
license=(Apache)
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FairwindsOps/pluto/archive/v$pkgver.tar.gz")
sha256sums=('da7f7ffd362eef346d713d12c15a4c0e1b3b078f4d8461b221eb992c9c085e06')

build() {
  cd $pkgname-$pkgver

  export VERSION=$pkgver
  make build
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
