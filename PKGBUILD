# Maintainer: Llathasa Veleth <llathasa at outlook dot com>
pkgname=rralle
pkgver=0.1.1
pkgrel=1
pkgdesc='Random quote fetching console utility'
arch=('any')
url="https://github.com/q60/$pkgname"
license=('MIT')
makedepends=('binutils' 'rebar3' 'make')
depends=('erlang')
provides=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('c23b8cbcc81e108eb5e784c97092c036974b4cc874cc6c4b6ad90b93ad6f7e94')

build() {
  cd "$pkgname-$pkgver"
  make build
}

package() {
  cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
