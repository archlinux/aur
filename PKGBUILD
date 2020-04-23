# Maintainer: David Birks <david@birks.dev>

pkgname=octant
pkgdesc='A tool for developers to understand how applications run on a Kubernetes cluster'
pkgver=0.12.1
pkgrel=1
arch=('x86_64')
license=('Apache')
url='https://github.com/vmware-tanzu/octant'
depends=('kubectl')
makedepends=('go' 'npm' 'git' 'python')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vmware/octant/archive/v$pkgver.tar.gz")
sha256sums=('f7f22a98b746334e94e90bc09e94a3a72a76485760ab6b94a9b5d5fa20c8934a')

build() {
  cd $pkgname-$pkgver
  go run build.go go-install
  go run build.go ci-quick
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/build/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
