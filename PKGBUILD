# Maintainer: David Birks <david@tellus.space>

pkgname=octant
pkgdesc='A tool for developers to understand how applications run on a Kubernetes cluster'
pkgver=0.7.0
pkgrel=1
arch=('x86_64')
license=('Apache')
url='https://github.com/vmware/octant'
depends=('kubectl')
makedepends=('go' 'npm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vmware/octant/archive/v$pkgver.tar.gz")
sha256sums=('b82f7fc7ba39d651d2764135685c784756f5dd58adcbe4bde2a332ffd0179219')

build() {
  cd $pkgname-$pkgver
  make go-install ci
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/build/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
