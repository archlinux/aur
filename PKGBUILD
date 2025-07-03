# Maintainer: Alessandro Bernardello <aleberna at erine dot eu>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=zenta-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="mindfulness for terminal users "
arch=('x86_64' 'aarch64')
url="https://github.com/e6a5/zenta"
license=('MIT')
conflicts=("zenta")
provides=("zenta")
source=("zenta-LICENSE::https://raw.githubusercontent.com/e6a5/zenta/refs/tags/v${pkgver}/LICENSE")
source_x86_64=("https://github.com/e6a5/zenta/releases/download/v${pkgver}/zenta-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("https://github.com/e6a5/zenta/releases/download/v${pkgver}/zenta-v${pkgver}-linux-arm64.tar.gz")
b2sums=('e7384d51cd8451dd6b68452f767374895b5371ce4cd7fb8607095af8415bc3621d70c0ab9756858d87ff58b24537f35ebaec97ce3bfd89192a303cc92bc78063')
b2sums_x86_64=('dc1d34f939e48fa0c55095c950c38de879f901961958214e3e7ad777188153833c83f4547c0e828c215e1ed5022e8bc85c1846c1b4e317b444de7076c56d5f7d')
b2sums_aarch64=('3d4077c4fbb76e520b6ca205a7f10fefa8e0f076365e8630a9faa660918fb2978507f3e154944970ea7acb86214865d47899026c7c1ef15426a34be64c98d544')

package() {
    if [[ "$CARCH" == "aarch64" ]]; then
        suffix="arm64"
    else
        suffix="amd64"
    fi
    install -Dm755 "zenta-v${pkgver}-linux-${suffix}" "$pkgdir/usr/bin/zenta"
    install -Dm644 zenta-LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
