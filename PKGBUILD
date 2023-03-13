# Maintainer: Luis Aleman Vazquez <luisv@tuta.io>

pkgname=cliphist
pkgver=0.4.0
pkgrel=2
epoch=1
_tag='5a4258fa72c0e34625f949c8114da9ae46c91b6f'
pkgdesc='clipboard history “manager” for wayland'
arch=('i686' 'x86_64')
url="https://github.com/sentriz/$pkgname"
license=('GPL3')
depends=('wl-clipboard')
makedepends=('go')
optdepends=('xdg-utils')
conflicts=('cliphist-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('381b92356e76229c5d15c2d42b3ee63734b7463aacbd200087abd6ed3c30c5ce')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
  go build -o $pkgname
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir"/usr/bin $pkgname
}

# vim:set ts=2 sw=2 et:
