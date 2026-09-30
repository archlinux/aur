# Maintainer: someoneonsmile <someoneonsmile@gmail.com>
pkgname=clip-cli-nightly-bin
conflicts=('clip' 'clip-bin' 'clip-cli-bin')
provides=('clip')
pkgver=3.0.1+nightly+20260930+0+g10afbd59
pkgrel=1
pkgdesc="System clipboard bridge for the terminal — nightly build (pipe content in, paste content out)"
arch=('x86_64' 'aarch64')
url="https://github.com/someoneonsmile/clip"
license=('MIT')

_source_base="${url}/releases/download/nightly"

# 同 aur/PKGBUILD：nightly 资产同样是滚动覆盖且文件名不含版本号，
# 本地文件名带上 pkgver（含日期+提交数+sha）可避免复用旧缓存。
source_x86_64=("clip-${pkgver}-x86_64-linux-gnu::${_source_base}/clip-x86_64-linux-gnu")
source_aarch64=("clip-${pkgver}-aarch64-linux-gnu::${_source_base}/clip-aarch64-linux-gnu")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
    cd "$srcdir"
    install -Dm755 "clip-${pkgver}-${CARCH}-linux-gnu" "$pkgdir/usr/bin/clip"
}
