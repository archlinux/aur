# Maintainer: David Birks <david@birks.dev>

pkgname=pluto
pkgver=3.5.0
pkgrel=1
pkgdesc='A cli tool to help discover deprecated apiVersions in Kubernetes'
arch=(x86_64)
url='https://github.com/FairwindsOps/pluto'
license=(Apache)
makedepends=('go' 'pkger')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FairwindsOps/pluto/archive/v$pkgver.tar.gz")
sha256sums=('99df374711d3b24048a34eef264a51c34e1efffb01678fe7a4c807ae408e5e41')

build() {
  cd $pkgname-$pkgver

  export VERSION=$pkgver
  make build
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
