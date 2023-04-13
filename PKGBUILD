# Maintainer: <tjmnkrajyej at gmail dot com>
pkgname=odinls
pkgver=880
pkgrel=1
pkgdesc='ols: language server for Odin'
arch=(x86_64)
url=https://github.com/DanielGavin/ols
license=(MIT)
depends=(odin)
options=('!lto')
source=(git+$url)
sha256sums=(SKIP)

pkgver() {
    cd ols
    git rev-list --count @
}

build() {
    cd ols
    ./build.sh
}

package() {
    install -D ols/ols "$pkgdir/usr/bin/ols"
}

