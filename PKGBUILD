# Maintainer: David Birks <david@birks.dev>

pkgname=octant
pkgdesc='A tool for developers to understand how applications run on a Kubernetes cluster'
pkgver=0.16.1
pkgrel=1
arch=('x86_64')
license=('Apache')
url='https://github.com/vmware-tanzu/octant'
depends=('kubectl')
makedepends=('go' 'npm' 'git' 'python' 'go.rice')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vmware/octant/archive/v$pkgver.tar.gz")
sha256sums=('36b99c245407c2b394b572223579c03450d484478a309349bcda1528c0a5dbd8')

build() {
  cd $pkgname-$pkgver
  go run build.go go-install
  go run build.go ci-quick
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/build/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
