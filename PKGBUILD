# Mainintainer : Lucas Rooyakkers <lucas dot rooyakkers at pm dot me>
pkgname=up-git
pkgver=5873371
pkgrel=1
license=('Apache')
pkgdesc="Ultimate Plumber is a tool for writing Linux pipes with instant live preview"
url="https://github.com/akavel/up"
arch=('x86_64')
provides=('up')
conflicts=('up' 'up-bin')
makedepends=('go')
source=("${pkgname}::git+${url}")
sha1sums=('SKIP')

pkgver() {
        cd "${pkgname}"
        echo $(git describe --always | sed 's/-/./g')
}

build() {
  cd ${pkgname}
  go build
}

package() {
  cd ${pkgname}
  install -Dm755 "up" "$pkgdir/usr/bin/up"
}

