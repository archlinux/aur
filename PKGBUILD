# Maintainer: novica <nnovica@gmail.com>

pkgname=ry-bin
pkgver=0.12.0 # renovate: datasource=github-releases depName=sims1253/ry
pkgrel=1
pkgdesc="A fast static checker for the R language, written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/sims1253/ry"
license=('MIT')
depends=('glibc' 'libgcc')
conflicts=('ry')
options=('!debug')
provides_x86_64=("ry=${pkgver}")
provides_aarch64=("ry=${pkgver}")
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/sims1253/ry/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/sims1253/ry/releases/download/v${pkgver}/ry-cli-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/sims1253/ry/releases/download/v${pkgver}/ry-cli-aarch64-unknown-linux-gnu.tar.gz")

package() {
    cd "$srcdir"

    install -Dm755 "ry-cli-${CARCH}-unknown-linux-gnu/ry" "$pkgdir/usr/bin/ry"
    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha256sums=('353fb9a55ca9189ff5f2b6a5a1484c38fa2e7dde5494a21de8361f6fe2cf9cbe')
sha256sums_x86_64=('f99312f121d29e66b813fbe36c62887e1b5f00a3135e90749fa354a052174b7f')
sha256sums_aarch64=('47b6422c481c644844c0c074e136ba7761ce4a2ec762b8f02b3e9e04582d9728')
