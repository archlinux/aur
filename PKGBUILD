# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=pamcan
pkgver=0.1
pkgrel=1
pkgdesc='Output an image of a Pam can on the console'
arch=('x86_64')
url='https://github.com/xyproto/pamcan/'
license=('MIT')
makedepends=('go')
source=("https://github.com/xyproto/pamcan/releases/download/0.1/pamcan-0.1.tar.gz")
sha256sums=('150934000c6f407f746b5a10fc4d0cdc987a3f85d86528b03321f272643ea7c3')

build() {
  cd "$pkgname-$pkgver"

  go build
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:ts=2 sw=2 et:
