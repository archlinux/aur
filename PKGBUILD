# Maintainer: David Birks <david@tellus.space>

pkgname=octant
pkgdesc='A tool for developers to understand how applications run on a Kubernetes cluster'
pkgver=0.5.1
pkgrel=1
arch=('x86_64')
license=('Apache')
url='https://github.com/vmware/octant'
depends=('kubectl')
makedepends=('go' 'npm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vmware/octant/archive/v$pkgver.tar.gz")
sha256sums=('29d43f526f79ee20f97688b28598f6281c405de46e56938822a9e189a6651621')

build() {
  cd $pkgname-$pkgver
  make go-install ci
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/build/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
