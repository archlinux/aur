# Maintainer: novica <nnovica@gmail.com>

pkgname=rpx-bin
pkgver=1.7.0 # renovate: datasource=github-tags depName=scalerail-solutions/rpx
pkgrel=1
pkgdesc="A performant package manager for R"
arch=('x86_64' 'aarch64')
url="https://github.com/scalerail-solutions/rpx"
license=('MIT')
depends=('glibc' 'gcc-libs' 'zlib')
conflicts=('rpx')
options=('!debug')
provides_x86_64=("rpx=${pkgver}")
provides_aarch64=("rpx=${pkgver}")
source_x86_64=("${pkgname}-${pkgver}.tar.xz::https://github.com/scalerail-solutions/rpx/releases/download/v${pkgver}/rpx-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${pkgname}-${pkgver}.tar.xz::https://github.com/scalerail-solutions/rpx/releases/download/v${pkgver}/rpx-aarch64-unknown-linux-gnu.tar.xz")

package() {
    cd "$srcdir"/rpx-*-unknown-linux-gnu

    install -Dm755 rpx "$pkgdir/usr/bin/rpx"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha256sums_x86_64=('150f1b241d20980ea1a0858a2eed3257d5b1cc1e1b0a5ad50c8523a1ddb1bdcd')
sha256sums_aarch64=('b39045f655f81178770a2a42b01ba3c828622dbda4383904dafca0e6c809cdfa')
