# Maintainer: Alex Gu <gualse.mail@yandex.com>
pkgname=mycorrhiza
pkgver=1.1.0
pkgrel=1
pkgdesc="Filesystem and git-based wiki engine written in Go using mycomarkup."
arch=('any')
url="https://github.com/bouncepaw/mycorrhiza"
license=('AGPL3')
depends=('git')
makedepends=('go' 'qtc')
source=("$pkgname-$pkgver::git+https://github.com/bouncepaw/mycorrhiza.git#tag=v${pkgver}")
sha512sums=('SKIP')

build() {
  cd $pkgname-$pkgver
  go generate
  go build -ldflags '-s' .
}

package() {
  install -Dm755 "mycorrhiza" "$pkgdir/usr/bin/mycorrhiza"
}

