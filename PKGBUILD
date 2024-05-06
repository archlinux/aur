pkgname=multi-gitter
pkgver=0.52.0
pkgdesc='Update multiple repositories in with one command'
pkgrel=1
arch=('x86_64')
url='https://github.com/lindell/multi-gitter'
source=("$pkgname-$pkgver.tar.gz::https://github.com/lindell/multi-gitter/archive/refs/tags/v${pkgver}.tar.gz")
depends=()
makedepends=('go')
b2sums=('ecf9615ce70e84a38424b4ed12d694d3d2d6c54b3d83c1e5761bceb5d82813147e868f5fb236ae8f6cd5df3444229b80b367a7ed25456b7d040ab26464cdd4e7')
license=('Apache')

build(){
  cd "$srcdir/$pkgname-$pkgver"
  GO111MODULE=on go build -o "$srcdir/bin/multi-gitter"
}

package() {
  cd "$srcdir/bin"
  install -Dm755 'multi-gitter' "$pkgdir/usr/bin/multi-gitter"
}
