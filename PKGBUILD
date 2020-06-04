# Maintainer: David Birks <david@birks.dev>

pkgname=octant
pkgdesc='A tool for developers to understand how applications run on a Kubernetes cluster'
pkgver=0.13.1
pkgrel=1
arch=('x86_64')
license=('Apache')
url='https://github.com/vmware-tanzu/octant'
depends=('kubectl')
makedepends=('go' 'npm' 'git' 'python')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vmware/octant/archive/v$pkgver.tar.gz")
sha256sums=('1d9992bb912696e4ff9b0c7981dfd48d207fab6eb7f179256809082da2430f8c')

build() {
  cd $pkgname-$pkgver
  go run build.go go-install
  go run build.go ci-quick
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/build/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
