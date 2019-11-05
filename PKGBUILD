# Maintainer: David Birks <david@tellus.space>

pkgname=octant
pkgdesc='A tool for developers to understand how applications run on a Kubernetes cluster'
pkgver=0.9.1
pkgrel=1
arch=('x86_64')
license=('Apache')
url='https://github.com/vmware/octant'
depends=('kubectl')
makedepends=('go' 'npm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vmware/octant/archive/v$pkgver.tar.gz")
sha256sums=('751c347f8efcaf05a36f8451979d3a0ede2b90a20fea4447b238c80f0522c136')

build() {
  export NG_CLI_ANALYTICS=ci

  cd $pkgname-$pkgver
  make go-install ci
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/build/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
