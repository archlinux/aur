# Maintainer: Luis Aleman Vazquez <luisv@tuta.io>

pkgname=cliphist
pkgver=0.3.1
pkgrel=1
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
sha256sums=('a0ff01e0d0fc601671d131773fc6f68a3116e631d74b97553dcf68502440e277')

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
