# Maintainer: novica <nnovica@gmail.com>

pkgname=r-ark-bin
pkgver=0.1.249
pkgrel=1
pkgdesc="An R kernel"
arch=('x86_64')
url="https://github.com/posit-dev/ark"
license=('MIT')
depends=('gcc-libs' 'glibc')
conflicts=('r-ark')
options=('!debug')
provides_x86_64=("r-ark=${pkgver}")
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/posit-dev/ark/releases/download/${pkgver}/ark-${pkgver}-linux-x64.zip"
                "https://raw.githubusercontent.com/posit-dev/ark/refs/tags/${pkgver}/LICENSE")

package() {
    cd "$srcdir"

    # Move the binary from the temporary install directory to the final location
    install -Dm755 "$srcdir/ark" "$pkgdir/usr/bin/r-ark"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha256sums_x86_64=('2653302c696612ce9f92dad8d31f013b496b520abd2d28e2f0fd494aa4f10743'
                   '19713ea69a4231105033c381dc2145148d26eab51e0b7e458ef4e775db531863')
