# Maintainer: Alex Gu <gualse.mail@yandex.com>
pkgname=mycorrhiza
pkgver=1.3.0
pkgrel=1
pkgdesc="Filesystem and git-based wiki engine written in Go using mycomarkup."
arch=('any')
url="https://github.com/bouncepaw/mycorrhiza"
license=('AGPL3')
depends=('git')
makedepends=('go')
source=("$pkgname-$pkgver::git+https://github.com/bouncepaw/mycorrhiza.git#tag=v${pkgver}")
sha512sums=('SKIP')

build() {
  cd $pkgname-$pkgver
  go build -ldflags '-s' .
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 "mycorrhiza" "$pkgdir/usr/bin/mycorrhiza"
}

