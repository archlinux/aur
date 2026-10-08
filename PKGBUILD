# Maintainer: novica <nnovica@gmail.com>

pkgname=r-rig-bin
pkgver=0.11.0 # renovate: datasource=github-tags depName=r-lib/rig
pkgrel=1
pkgdesc="The R Installation Manager"
arch=('x86_64' 'aarch64')
url="https://github.com/r-lib/rig"
license=('MIT')
depends=(
    gcc-libs
    glibc
)
conflicts=('r-rig')
options=('!debug')
provides_x86_64=("r-rig=${pkgver}")
provides_aarch64=("r-rig=${pkgver}")
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/r-lib/rig/releases/download/v${pkgver}/rig-linux-x86_64-${pkgver}.tar.gz"
                "https://raw.githubusercontent.com/r-lib/rig/refs/tags/v${pkgver}/LICENSE")
source_aarch64=("${pkgname}-${pkgver}.tar.gz::https://github.com/r-lib/rig/releases/download/v${pkgver}/rig-linux-aarch64-${pkgver}.tar.gz"
                 "https://raw.githubusercontent.com/r-lib/rig/refs/tags/v${pkgver}/LICENSE")

package() {
    cd "$srcdir"

    # Move the binary from the temporary install directory to the final location
    install -Dm755 "$srcdir/bin/rig" "$pkgdir/usr/bin/r-rig"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha256sums_x86_64=('27e063df84b6dadb325fa96d13951676b44b69103bb4237b061518fbf564fcf1'
                   '6cd5c8d39a38fe457509cb88b5ab333f078c7b05014d27dfebeb69fd4b490db2')
sha256sums_aarch64=('27e063df84b6dadb325fa96d13951676b44b69103bb4237b061518fbf564fcf1'
                    '6cd5c8d39a38fe457509cb88b5ab333f078c7b05014d27dfebeb69fd4b490db2')
