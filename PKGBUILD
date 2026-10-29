# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="yolobox-bin"
pkgver=0.19.12
pkgrel=1
pkgdesc="Run AI coding agents in a sandboxed container - your home directory stays home"
url="https://github.com/finbarr/yolobox"
license=("MIT")
arch=("x86_64" "aarch64")
optdepends=(
    "docker: container runtime"
    "podman: container runtime"
)
provides=("yolobox")
conflicts=("yolobox")
source=("https://raw.githubusercontent.com/finbarr/yolobox/v$pkgver/LICENSE")
source_x86_64=("$pkgname-$pkgver-x86_64::$url/releases/download/v$pkgver/yolobox-linux-amd64")
source_aarch64=("$pkgname-$pkgver-aarch64::$url/releases/download/v$pkgver/yolobox-linux-arm64")
b2sums=('fe230bad4a1caa6fdab54f0652c9c0ce29d3a503ff6baa679e06b434795bd47d9378cf3daf0c2fd939fe8b354ed965ce531510b1cefb84009fda1b7635c9336c')
b2sums_x86_64=('9f0c43b4bd870c0f4dc39fae3bf96602c47461b3df5d9f51eed2a60d63205fba7b0e545eb0d9dde5968102bfa58d742f3d57e000a881d1c0b3233493da21c300')
b2sums_aarch64=('44c1b54c36c7f28201600d5356fcbde948639e32f08548891f25d0a40898d62256ac0f4c87852e1292f89315322a63cdc6baa159e8650057cec89d035b4e2c1e')
options=("!strip")

package() {
 install -D -m 755 "$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/yolobox"
 install -D -m 644 "LICENSE" "$pkgdir/usr/share/licenses/yolobox/LICENSE"
}
