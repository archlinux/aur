# Maintainer: David Birks <david@tellus.space>
# Contributor: David Stark <david@starkers.org>

pkgname=dive
pkgver=0.9.0
pkgrel=1
pkgdesc='A tool for exploring each layer in a docker image'
url='https://github.com/wagoodman/dive'
arch=('x86_64')
license=('MIT')
depends=('docker')
makedepends=('go')
conflicts=('dive-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wagoodman/dive/archive/v$pkgver.tar.gz")
sha256sums=('f72a6a0ae29b0e855cf6687062ba6b0c380c14527030e60f5b9091f0ddbcc135')

build() {
  cd $pkgname-$pkgver
  go build \
    -trimpath \
    -ldflags "-X main.version=$pkgver" \
    -o bin/dive \
    .
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/bin/dive" "$pkgdir/usr/bin/dive"
}
