# Maintainer: novica <nnovica@gmail.com>

pkgname=r-air-bin
pkgver=0.8.1
pkgrel=2
pkgdesc="An R language server and formatter"
arch=('x86_64')
url="https://github.com/posit-dev/air"
license=('MIT')
depends=('gcc-libs' 'glibc')
conflicts=('r-air')
options=('!debug')
provides_x86_64=("r-air=${pkgver}")
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/posit-dev/air/releases/download/${pkgver}/air-$CARCH-unknown-linux-gnu.tar.gz"
                "https://raw.githubusercontent.com/posit-dev/air/refs/tags/${pkgver}/LICENSE")
sha256sums_x86_64=('7181858812eaca3a5c6f73d1e013c4be0afc55eb5732395b3a3b98fc751a6f34'
                   '19713ea69a4231105033c381dc2145148d26eab51e0b7e458ef4e775db531863')



package() {
    cd "$srcdir"

    # Move the binary from the temporary install directory to the final location
    install -Dm755 "$srcdir/air-$CARCH-unknown-linux-gnu/air" "$pkgdir/usr/bin/r-air"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
