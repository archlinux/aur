# Maintainer: novica <nnovica@gmail.com>

pkgname=r-air-bin
pkgver=0.7.1
pkgrel=2
pkgdesc="An R language server and formatter"
arch=('x86_64')
url="https://github.com/posit-dev/air"
license=('MIT')
depends=('gcc-libs' 'glibc')
options=('!debug')
provides_x86_64=("r-air=${pkgver}")
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/posit-dev/air/releases/download/${pkgver}/air-$CARCH-unknown-linux-gnu.tar.gz"
                "https://raw.githubusercontent.com/posit-dev/air/refs/tags/${pkgver}/LICENSE")
sha256sums_x86_64=('f066d2d97e3b9960b03da9fdf85e83d5400db346765e274fbba3451349db8755'
                   '19713ea69a4231105033c381dc2145148d26eab51e0b7e458ef4e775db531863')



package() {
    cd "$srcdir"

    # Move the binary from the temporary install directory to the final location
    install -Dm755 "$srcdir/air-$CARCH-unknown-linux-gnu/air" "$pkgdir/usr/bin/r-air"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
