# Maintainer: David Birks <david@tellus.space>

pkgname=octant
pkgdesc='A tool for developers to understand how applications run on a Kubernetes cluster'
pkgver=0.9.0
pkgrel=1
arch=('x86_64')
license=('Apache')
url='https://github.com/vmware/octant'
depends=('kubectl')
makedepends=('go' 'npm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vmware/octant/archive/v$pkgver.tar.gz")
sha256sums=('543ac7f643b266d6919a4b5ce9155705153113c69a6cca8e4d51f6c0255a07e0')

build() {
  export NG_CLI_ANALYTICS=ci

  cd $pkgname-$pkgver
  make go-install ci
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/build/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
