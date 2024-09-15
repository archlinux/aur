pkgname=multi-gitter
pkgver=0.53.1
pkgdesc='Update multiple repositories in with one command'
pkgrel=1
arch=('x86_64')
url='https://github.com/lindell/multi-gitter'
source=("$pkgname-$pkgver.tar.gz::https://github.com/lindell/multi-gitter/archive/refs/tags/v${pkgver}.tar.gz")
depends=()
makedepends=('go')
b2sums=('5f9aa3e67a51c6219e6821d56b9e130df08dd08405398c2ccedf017ef7bf28b31199b31ffc0eb6ec7c6bc763bebd5baa5348ea77b602d25207c49c8251b497e4')
license=('Apache')

build(){
  cd "$srcdir/$pkgname-$pkgver"
  GO111MODULE=on go build -o "$srcdir/bin/multi-gitter"
}

package() {
  cd "$srcdir/bin"
  install -Dm755 'multi-gitter' "$pkgdir/usr/bin/multi-gitter"
}
