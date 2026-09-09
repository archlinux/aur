# Maintainer: Guru <anjanaya@gmail.com>
pkgname=pipenet
pkgver=1.4.3
pkgrel=1
pkgdesc="Expose your local server to the public internet instantly"
arch=('x86_64')
url="https://github.com/punkpeye/pipenet"
license=('MIT')
makedepends=('bun')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/punkpeye/pipenet/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ae61d70bb1fb5ef5c71508aa7a9ce55efb468723e9733a5759ebcdecab8bd118')

build() {
    cd "${pkgname}-${pkgver}"
    /usr/bin/bun install
    /usr/bin/bun build --compile --minify src/cli.ts --outfile pipenet
}

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/pipenet" "${pkgdir}/usr/bin/pipenet"
}
