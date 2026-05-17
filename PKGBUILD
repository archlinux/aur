# Maintainer: Guru <anjanaya@gmail.com>
pkgname=pipenet
pkgver=1.4.2
pkgrel=1
pkgdesc="Expose your local server to the public internet instantly"
arch=('x86_64')
url="https://github.com/punkpeye/pipenet"
license=('MIT')
makedepends=('bun')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/punkpeye/pipenet/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('488274c73c75698de06c5d5931a265cb587c148d0521fc4b3994e188ed48679f')

build() {
    cd "${pkgname}-${pkgver}"
    /usr/bin/bun install
    /usr/bin/bun build --compile --minify src/cli.ts --outfile pipenet
}

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/pipenet" "${pkgdir}/usr/bin/pipenet"
}
