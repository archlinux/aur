pkgname=multi-gitter
pkgver=0.58.0
pkgdesc='Update multiple repositories in with one command'
pkgrel=1
arch=('x86_64')
url='https://github.com/lindell/multi-gitter'
source=("$pkgname-$pkgver.tar.gz::https://github.com/lindell/multi-gitter/archive/refs/tags/v${pkgver}.tar.gz")
depends=()
makedepends=('go')
b2sums=('07ad3869743bbb878a6e57282f40913a04e7d9e8cb7a84fb034eae5e9d9556b98ed0393c7501b31375a5f7106b129e27b8c43a9a093a71a6a0abeb28c5f706d4')
license=('Apache')

build(){
  cd "$srcdir/$pkgname-$pkgver"
  GO111MODULE=on go build -o "$srcdir/bin/multi-gitter"
}

package() {
  cd "$srcdir/bin"
  install -Dm755 'multi-gitter' "$pkgdir/usr/bin/multi-gitter"
}
