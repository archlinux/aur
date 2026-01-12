# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="yolobox-bin"
pkgver=0.1.0
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
b2sums_x86_64=('00b99f15534cd392b299bd60826553f90c5997dd934a1d3216bdc2efacbab9afce1f19082b1b42348fa7af2755a8b5ecefcf2bc88c51daf4e47a23b3fd2dff36')
b2sums_aarch64=('4a60c3ad05a1481d6a4c36fb795f6dc2ad3cbc031e5a401497fdb75c7e811d6921d3f3dc3852037d3b43819289c346d4c7d887ce9948a58cb1693542156164da')
options=("!strip")

package() {
 install -D -m 755 "$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/yolobox"
 install -D -m 644 "LICENSE" "$pkgdir/usr/share/licenses/yolobox/LICENSE"
}
