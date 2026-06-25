# Maintainer: novica <nnovica@gmail.com>

pkgname=r-rig-bin
pkgver=0.8.1 # renovate: datasource=github-tags depName=r-lib/rig
pkgrel=1
pkgdesc="The R Installation Manager"
arch=('x86_64')
url="https://github.com/r-lib/rig"
license=('MIT')
depends=(
    gcc-libs
    glibc
)
conflicts=('r-rig')
options=('!debug')
provides_x86_64=("r-rig=${pkgver}")
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/r-lib/rig/releases/download/v${pkgver}/rig-linux-${pkgver}.tar.gz"
                "https://raw.githubusercontent.com/r-lib/rig/refs/tags/v${pkgver}/LICENSE")

package() {
    cd "$srcdir"

    # Move the binary from the temporary install directory to the final location
    install -Dm755 "$srcdir/bin/rig" "$pkgdir/usr/bin/r-rig"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha256sums_x86_64=('b7b44279144b713f99390003ee9d4489c8bced27e1da7a71af957516c501973b'
                   '6cd5c8d39a38fe457509cb88b5ab333f078c7b05014d27dfebeb69fd4b490db2')
