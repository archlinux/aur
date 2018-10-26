# Mainintainer : Lucas Rooyakkers <lucas dot rooyakkers at pm dot me>
pkgname=up
pkgver=0.2.1
pkgrel=1
license=('Apache')
pkgdesc="Ultimate Plumber is a tool for writing Linux pipes with instant live preview"
url="https://github.com/akavel/up"
arch=('any')
provides=('up')
conflicts=('up-git' 'up-bin')
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=('b90978848da38318bec452601d0d5810')

build() {
  tar -xzvf "v${pkgver}.tar.gz"
  cd "up-${pkgver}"
  go build
}

package() {
  cd "up-${pkgver}"
  install -Dm755 "up" "$pkgdir/usr/bin/up"
}

