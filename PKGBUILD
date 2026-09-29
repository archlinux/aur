# Maintainer: someoneonsmile <someoneonsmile@gmail.com>
pkgname=clip-cli-bin
conflicts=('clip' 'clip-bin')
provides=('clip')
pkgver=3.0.1
pkgrel=1
pkgdesc="System clipboard bridge for the terminal - pipe content in, paste content out"
arch=('x86_64' 'aarch64')
url="https://github.com/someoneonsmile/clip"
license=('MIT')

_source_base="${url}/releases/download/v${pkgver}"

# 下载到 SRCDEST 的本地文件名带上 pkgver：
# 上游资产名不含版本号，若沿用原名，makepkg 会静默复用上一次缓存的二进制，
# 导致「包版本是新的、内容却是旧的」。文件名随 pkgver 变化可强制重新下载。
source_x86_64=("clip-${pkgver}-x86_64-linux-gnu::${_source_base}/clip-x86_64-linux-gnu")
source_aarch64=("clip-${pkgver}-aarch64-linux-gnu::${_source_base}/clip-aarch64-linux-gnu")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
    cd "$srcdir"
    install -Dm755 "clip-${pkgver}-${CARCH}-linux-gnu" "$pkgdir/usr/bin/clip"
}
