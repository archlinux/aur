# Maintainer: Theodore Huang <teddyhuangnan@gmail.com>
pkgname=sshping-rs-bin
pkgver=0.5.0
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
sha256sums_x86_64=('8ea1b0fab3405d0a10a312d184718c9df456c3c683de0677267149a12ad52389')
sha256sums_aarch64=('258f9766a8fa85b10c78f92e7a910c39bab49c34865ac3795db903fb335ed6f5')

package() {
    cd "$srcdir/sshping-$CARCH-unknown-linux-musl/" || exit
    install -Dm755 sshping "$pkgdir/usr/bin/sshping"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
