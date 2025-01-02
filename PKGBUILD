pkgname=multi-gitter
pkgver=0.55.0
pkgdesc='Update multiple repositories in with one command'
pkgrel=1
arch=('x86_64')
url='https://github.com/lindell/multi-gitter'
source=("$pkgname-$pkgver.tar.gz::https://github.com/lindell/multi-gitter/archive/refs/tags/v${pkgver}.tar.gz")
depends=()
makedepends=('go')
b2sums=('7836989afb05d3774be238a77567692ed1d5a4bf3df8caf8a933fae17963e6abfd45b7341e2b8a3aae640c8870e7665b7acc636c8d5f13f578213e2a35de1a53')
license=('Apache')

build(){
  cd "$srcdir/$pkgname-$pkgver"
  GO111MODULE=on go build -o "$srcdir/bin/multi-gitter"
}

package() {
  cd "$srcdir/bin"
  install -Dm755 'multi-gitter' "$pkgdir/usr/bin/multi-gitter"
}
