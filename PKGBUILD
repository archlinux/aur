# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="yolobox-bin"
pkgver=0.19.13
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
b2sums_x86_64=('ed44c6a9fb11b9e6c654a14ff81ded017a7bcfa84cb3e084b89a92129a665ef7573eebf66a8c607c2374a0a1aaeb4a3cf68c29a1fec87348861ad5b676d9a8b2')
b2sums_aarch64=('538d671f416547e751bf551d697349a35670cfdbae84c66fa280153af53a158979fd949e74f60e0caeceba11b7ac9dac9abbcfa0409a2c1d77596880c9cfc2c1')
options=("!strip")

package() {
 install -D -m 755 "$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/yolobox"
 install -D -m 644 "LICENSE" "$pkgdir/usr/share/licenses/yolobox/LICENSE"
}
