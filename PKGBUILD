# Maintainer: novica <nnovica@gmail.com>

pkgname=ry-bin
pkgver=0.11.0 # renovate: datasource=github-tags depName=sims1253/ry
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
sha256sums_x86_64=('e5dd6ac4789110c2fa8bd9944be2d4876addd7e5f35b39b0b756500bc3126b98')
sha256sums_aarch64=('b6597ec29a543f145f3166f22547122fd60633a78b3ef18d70d35848bffbdf38')
