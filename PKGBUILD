# Maintainer: David Birks <david@birks.dev>

pkgname=pluto
pkgver=2.0.1
pkgrel=1
pkgdesc='A cli tool to help discover deprecated apiVersions in Kubernetes'
arch=(x86_64)
url='https://github.com/FairwindsOps/pluto'
license=(Apache)
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FairwindsOps/pluto/archive/v$pkgver.tar.gz")
sha256sums=('22da2f51e48ec42463c53feb7d248b4313061fc9f952572ec48017432ba09a38')

build() {
  cd $pkgname-$pkgver

  export VERSION=$pkgver
  make build
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
