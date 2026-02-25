# Maintainer: bbj <benigno at duck dot com>
pkgname=parqeye-bin
pkgver=0.0.2
pkgrel=1
pkgdesc='Peek inside Parquet files right from your terminal'
arch=('x86_64' 'aarch64')
url='https://github.com/kaushiksrini/parqeye'
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=('parqeye')
conflicts=('parqeye')
_x86_64_target='x86_64-unknown-linux-gnu'
_aarch64_target='aarch64-unknown-linux-gnu'
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${url}/releases/download/v${pkgver}/parqeye-${_x86_64_target}.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${url}/releases/download/v${pkgver}/parqeye-${_aarch64_target}.tar.xz")
sha256sums_x86_64=('68d03738b0bbe6c70e45008cffd7f1bda194dad921c97359de87b2ab43f51fc3')
sha256sums_aarch64=('a8ae74222514bb8ae61fa58065cc59f5b82b7b31fbc57433ef2ef88b3a085dc1')

_target() {
    case "$CARCH" in
        x86_64) echo "$_x86_64_target" ;;
        aarch64) echo "$_aarch64_target" ;;
    esac
}

package() {
    cd "parqeye-$(_target)"
    install -Dm755 parqeye "${pkgdir}/usr/bin/parqeye"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
