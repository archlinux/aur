# Maintainer: Guru <anjanaya@gmail.com>
pkgname=pipenet
pkgver=1.4.0
pkgrel=1
pkgdesc="Expose your local server to the public internet instantly"
arch=('x86_64')
url="https://github.com/punkpeye/pipenet"
license=('MIT')
makedepends=('bun')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/punkpeye/pipenet/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cb3ff9596abe33587483016b217379ccb7774f35a77dc9cd2df45efd1eb3febc')

build() {
    cd "${pkgname}-${pkgver}"
    bun install
    bun build --compile --minify src/cli.ts --outfile pipenet
}

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/pipenet" "${pkgdir}/usr/bin/pipenet"
}
