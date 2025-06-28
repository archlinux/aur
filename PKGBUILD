# Maintainer: Alessandro Bernardello <aleberna at erine dot eu>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=zenta-bin
pkgver=0.3.5
pkgrel=1
pkgdesc="mindfulness for terminal users "
arch=('x86_64' 'aarch64')
url="https://github.com/e6a5/zenta"
license=('MIT')
conflicts=("zenta")
provides=("zenta")
source_x86_64=("https://github.com/e6a5/zenta/releases/download/v${pkgver}/zenta-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("https://github.com/e6a5/zenta/releases/download/v${pkgver}/zenta-v${pkgver}-linux-arm64.tar.gz")
b2sums_x86_64=('41ecf7c4e219fdffe3314b20489da438994896784a1888b77f7bb9d59a25946db05347f5212925eb105740c3f1e57c3f3edb56d602bee89cdd804579c94624c0')
b2sums_aarch64=('04a3709050465af357c30ac5c8229c3a992b283895e7dadffdbefe5c575cfe5cf4bd279fcf6ef6ab5fad3d10595c1a1efb9f2f42654fb206d10f18a1e68159f8')

package() {
    if [[ "$CARCH" == "aarch64" ]]; then
        suffix="arm64"
    else
        suffix="amd64"
    fi
    install -Dm755 "zenta-v${pkgver}-linux-${suffix}" "$pkgdir/usr/bin/zenta"
}
