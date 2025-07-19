# Maintainer: Alessandro Bernardello <aleberna at erine dot eu>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=zenta-bin
pkgver=1.1.0
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
b2sums_x86_64=('a2abd6d09df9f92d73da6579ec49723fbd3729e8e00fd31adaf2c382ea4560507f3ed52de24597ddc5d4ab78f3c868d4dd765fc9f7ab0d61bb24709711b7e93c')
b2sums_aarch64=('ae5c1b51eee587c881f982470376ccdc42bc394a9f4c9638b090e7ad13159c514b610a28cd529eea2c5765ee98ef9ac7dc33911bf3011c2c878ebb5b531d88bd')

package() {
    if [[ "$CARCH" == "aarch64" ]]; then
        suffix="arm64"
    else
        suffix="amd64"
    fi
    install -Dm755 "zenta-v${pkgver}-linux-${suffix}" "$pkgdir/usr/bin/zenta"
    install -Dm644 zenta-LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
