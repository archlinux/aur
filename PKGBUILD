# Maintainer: David Birks <david@birks.dev>

pkgname=octant
pkgdesc='A tool for developers to understand how applications run on a Kubernetes cluster'
pkgver=0.15.0
pkgrel=1
arch=('x86_64')
license=('Apache')
url='https://github.com/vmware-tanzu/octant'
depends=('kubectl')
makedepends=('go' 'npm' 'git' 'python' 'go.rice')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vmware/octant/archive/v$pkgver.tar.gz")
sha256sums=('565eb472ca1f42cf09e2adf2242c64b38a087a00fbe905ed92821c3a2c7688a1')

build() {
  cd $pkgname-$pkgver
  go run build.go go-install
  go run build.go ci-quick
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/build/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
