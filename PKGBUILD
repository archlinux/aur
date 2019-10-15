# Maintainer: David Birks <david@tellus.space>

pkgname=octant
pkgdesc='A tool for developers to understand how applications run on a Kubernetes cluster'
pkgver=0.8.0
pkgrel=1
arch=('x86_64')
license=('Apache')
url='https://github.com/vmware/octant'
depends=('kubectl')
makedepends=('go' 'npm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vmware/octant/archive/v$pkgver.tar.gz")
sha256sums=('5605e3926dd3d9d32326d97bf4ab4dc7865bafc601f1c70885e7a1fd1dc98ee4')

build() {
  cd $pkgname-$pkgver
  make go-install ci
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/build/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
