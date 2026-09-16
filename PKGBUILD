# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=parqeye-bin
pkgver=0.2.0
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
sha256sums_x86_64=('7f9b444665132b827e904fc360455209f37da27417dffcbf7b0741285bd53e24')
sha256sums_aarch64=('6e9eb7703697f19b84ab5d66136f0dce2a1c4bb0b374e2b0ea7f1b65d47e9727')

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
