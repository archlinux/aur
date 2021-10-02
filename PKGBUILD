# Maintainer: Radoslav Georgiev <rgeorgiev583@gmail.com>
pkgname='compose-switch'
pkgver=1.0.2
pkgrel=2
pkgdesc='compatibility layer for the docker-compose V1 CLI'
arch=('x86_64')
url='https://github.com/docker/compose-switch'
license=('Apache')
depends=('docker-compose>=2')
makedepends=('go')
conflicts=('docker-compose<2' 'compose-switch-bin')
source=("https://github.com/docker/compose-switch/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ab207defae7a6c2c2997221a634eac719bfa96da0fdbe71204ff2abedce89f80')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    install -Dm755 bin/docker-compose "$pkgdir/usr/bin/docker-compose"
}
