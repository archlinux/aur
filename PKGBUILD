# Maintainer: Theodore Huang <teddyhuangnan@gmail.com>
pkgname=sshping-rs-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="SSH-based ping that measures interactive character echo latency and file transfer throughput. Pronounced \"shipping\"."
arch=("x86_64" "aarch64")
url="https://github.com/TeddyHuang-00/sshping"
license=("MIT")
provides=("sshping")
options=("!debug")
source=(
    "LICENSE-$pkgver::https://raw.githubusercontent.com/TeddyHuang-00/sshping/refs/tags/v${pkgver}/LICENSE"
)
source_x86_64=(
    "$pkgname-x86_64-$pkgver::https://github.com/TeddyHuang-00/sshping/releases/download/v${pkgver}/sshping-x86_64-unknown-linux-musl.tar.xz"
)
source_aarch64=(
    "$pkgname-aarch64-$pkgver::https://github.com/TeddyHuang-00/sshping/releases/download/v${pkgver}/sshping-aarch64-unknown-linux-musl.tar.xz"
)
# checksum generate with 'makepkg -g'
sha256sums=('dfe6a1167615268ed336d18cab68e90050311faa7cadc9ccb97de85ef3f7da97')
sha256sums_x86_64=('2f2d52760b927d08eef951f156978e5b9824dce311be66f127373de7ab5c2891')
sha256sums_aarch64=('b836773bec10e5d58eee7289a8928d4491bf9faef46ef43ecf76d61f59918ea1')

package() {
    cd "$srcdir/sshping-$CARCH-unknown-linux-musl/" || exit
    install -Dm755 sshping "$pkgdir/usr/bin/sshping"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
