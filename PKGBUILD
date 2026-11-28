# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="yolobox-bin"
pkgver=0.19.14
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
b2sums_x86_64=('70b296357ab7d5d9cd401b5940c3be223349c1201daf0a5690b1edfc09af82b41f773e3621cd3b4388c28e02418acf4a6c9a91ce6821ed19e734c001f85590ba')
b2sums_aarch64=('01388163fedafef6c9b8cc5bf4a6de74f6eefa9a65ed602746b33e4f4b4222e56fddffad3760277c1b5da840786d7cfe23a0c2d0226e9dba91dd9d30a4c238d1')
options=("!strip")

package() {
 install -D -m 755 "$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/yolobox"
 install -D -m 644 "LICENSE" "$pkgdir/usr/share/licenses/yolobox/LICENSE"
}
