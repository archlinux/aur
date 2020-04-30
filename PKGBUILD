# Maintainer: Richard Steinmetz <steinmetz.richard@googlemail.com>

pkgname=docker-bashbrew
pkgver=0.1.0
pkgrel=1
pkgdesc='Canonical build tool for the official docker images'
arch=('x86_64')
url='https://github.com/docker-library/bashbrew'
license=('Apache')
depends=('docker>=1:10' 'git')
makedepends=('go-pie')
provides=('bashbrew')
conflicts=('bashbrew')
source=("git+$url#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir/bashbrew"
  GO111MODULE=on go build -o ./bin/bashbrew -mod vendor ./cmd/bashbrew
}

package() {
  cd "$srcdir/bashbrew"
  install -Dm 755 ./bin/bashbrew "$pkgdir/usr/bin/bashbrew"
}
