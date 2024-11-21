pkgname=multi-gitter
pkgver=0.54.1
pkgdesc='Update multiple repositories in with one command'
pkgrel=1
arch=('x86_64')
url='https://github.com/lindell/multi-gitter'
source=("$pkgname-$pkgver.tar.gz::https://github.com/lindell/multi-gitter/archive/refs/tags/v${pkgver}.tar.gz")
depends=()
makedepends=('go')
b2sums=('79aeb218845846046d0376f282f341bd8ac2775130e78461e672db0d39a41b6332cb730c4e544b00a5ec56fbfc953db02c5523c6fae01aa0b85667d41a12ebb1')
license=('Apache')

build(){
  cd "$srcdir/$pkgname-$pkgver"
  GO111MODULE=on go build -o "$srcdir/bin/multi-gitter"
}

package() {
  cd "$srcdir/bin"
  install -Dm755 'multi-gitter' "$pkgdir/usr/bin/multi-gitter"
}
