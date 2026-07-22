# Maintainer: novica <nnovica@gmail.com>

pkgname=r-air-bin
pkgver=0.11.0 # renovate: datasource=github-tags depName=posit-dev/air
pkgrel=1
pkgdesc="An R language server and formatter"
arch=('x86_64')
url="https://github.com/posit-dev/air"
license=('MIT')
depends=('glibc' 'libgcc')
conflicts=('r-air')
options=('!debug')
provides_x86_64=("r-air=${pkgver}")

source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/posit-dev/air/releases/download/${pkgver}/air-x86_64-unknown-linux-gnu.tar.gz"
                "https://raw.githubusercontent.com/posit-dev/air/refs/tags/${pkgver}/LICENSE")

package() {
    cd "$srcdir"

    # Move the binary from the temporary install directory to the final location
    install -Dm755 "$srcdir/air-x86_64-unknown-linux-gnu/air" "$pkgdir/usr/bin/r-air"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha256sums_x86_64=('b6dd1446386a7e7c6981a049a164cb4950edaf004f675b0be1454923ae846593'
                   '19713ea69a4231105033c381dc2145148d26eab51e0b7e458ef4e775db531863')
