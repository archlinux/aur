# Maintainer: Glen Ogilvie <nelg at linuxsolutions dot co dot nz>

pkgname=tfautomv
pkgver=0.4.0
pkgrel=1
pkgdesc='Automatic Terraform moved blocks'
arch=('x86_64')
url='https://github.com/padok-team/tfautomv'
license=('Apache')
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('b0e1abbf677f5d5287497238da3b8745f256a67d5674c0bedf7150172cb29385')

build() {
  cd "tfautomv-$pkgver"
  make build
}

package() {
  cd "tfautomv-$pkgver"
  install -Dm755 "bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
