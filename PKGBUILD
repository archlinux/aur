# Maintainer: Glen Ogilvie <nelg at linuxsolutions dot co dot nz>

pkgname=tfautomv
pkgver=0.5.0
pkgrel=1
pkgdesc='Generate Terraform moved blocks automatically for painless refactoring'
arch=('x86_64')
url='https://github.com/padok-team/tfautomv'
license=('Apache')
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('5224c8974fabd9945f8a642fc60e0813a3b69523d2c8d01216a345ffc89d59ff')

build() {
  cd "tfautomv-$pkgver"
  make build
}

package() {
  cd "tfautomv-$pkgver"
  install -Dm755 "bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
