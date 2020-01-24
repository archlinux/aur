# Maintainer: David Birks <david@birks.dev>

pkgname=octant
pkgdesc='A tool for developers to understand how applications run on a Kubernetes cluster'
pkgver=0.10.0
pkgrel=1
arch=('x86_64')
license=('Apache')
url='https://github.com/vmware/octant'
depends=('kubectl')
makedepends=('go' 'npm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vmware/octant/archive/v$pkgver.tar.gz")
sha256sums=('da7ab643408c0f4cb2af85d32a9335944bbd41d5569d8e7cebfda08df0e4e41a')

build() {
  cd $pkgname-$pkgver
  go run build.go go-install
  go run build.go ci
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/build/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
