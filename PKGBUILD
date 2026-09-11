# Maintainer: novica <nnovica@gmail.com>

pkgname=rpx-bin
pkgver=2.0.0 # renovate: datasource=github-tags depName=scalerail-solutions/rpx
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

sha256sums_x86_64=('67d7e66688777da135847ca38b0149ccdb3e4bb4e101a9aa52555dc3fd126d37')
sha256sums_aarch64=('67d7e66688777da135847ca38b0149ccdb3e4bb4e101a9aa52555dc3fd126d37')
