# Maintainer: Luis Aleman Vazquez <luisv@tuta.io>

pkgname=cliphist
pkgver=0.4.0
pkgrel=3
epoch=1
pkgdesc='clipboard history “manager” for wayland'
arch=('i686' 'x86_64')
url="https://github.com/sentriz/$pkgname"
license=('GPL3')
depends=('wl-clipboard')
makedepends=('go')
optdepends=('xdg-utils')
conflicts=('cliphist-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e492d6cd4e1bfc77582e32e25a3683687f2ff22e8d390cd06e14d21d7bef32c2')

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
