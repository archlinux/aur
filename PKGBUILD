# Maintainer: David Birks <david@birks.dev>

pkgname=octant
pkgdesc='A tool for developers to understand how applications run on a Kubernetes cluster'
pkgver=0.16.0
pkgrel=1
arch=('x86_64')
license=('Apache')
url='https://github.com/vmware-tanzu/octant'
depends=('kubectl')
makedepends=('go' 'npm' 'git' 'python' 'go.rice')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vmware/octant/archive/v$pkgver.tar.gz")
sha256sums=('6e1891fe0cbd7447f5de8b2fca2349eb7a33e3451ff7ced48c9402af6f539517')

build() {
  cd $pkgname-$pkgver
  go run build.go go-install
  go run build.go ci-quick
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/build/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
