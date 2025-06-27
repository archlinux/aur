# Maintainer: Alessandro Bernardello <aleberna at erine dot eu>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=zenta-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="mindfulness for terminal users "
arch=('x86_64' 'aarch64')
url="https://github.com/e6a5/zenta"
license=('MIT')
conflicts=("zenta")
provides=("zenta")
depends=("glibc")
source_x86_64=("https://github.com/e6a5/zenta/releases/download/v0.3.1/zenta-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("https://github.com/e6a5/zenta/releases/download/v0.3.1/zenta-v${pkgver}-linux-arm64.tar.gz")
b2sums_x86_64=('f8fd8ff6100660585778992db686e587357006fd01bf3adfe836720daaa0c54fa7ac128df57478f4337377f901af8a38ccaf6dee9672c4434a4b4305de14a9c9')
b2sums_aarch64=('1a57a0e6d8a6af9d5887af1a45d169f73bd0eab4078a3b8d8481ff84ab368c7a09b808160827089fde1ff01723dd06369779252235764543f17012f1f4121441')

package() {
    if [[ "$CARCH" == "aarch64" ]]; then
        suffix="arm64"
    else
        suffix="amd64"
    fi
    install -Dm755 "zenta-v${pkgver}-linux-${suffix}" "$pkgdir/usr/bin/zenta"
}
