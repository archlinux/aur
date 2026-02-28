# Maintainer: novica <nnovica@gmail.com>

pkgname=r-ark-bin
pkgver=0.1.233
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
sha256sums_x86_64=('3cdaf9b979b755fc24d33429163e7c0b8a302a34bac15620c5bd8b4a5d7cdc8b'
                   '19713ea69a4231105033c381dc2145148d26eab51e0b7e458ef4e775db531863')



package() {
    cd "$srcdir"

    # Move the binary from the temporary install directory to the final location
    install -Dm755 "$srcdir/ark" "$pkgdir/usr/bin/r-ark"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
