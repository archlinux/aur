# Maintainer: Alessandro Bernardello <aleberna at erine dot eu>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=zenta-bin
pkgver=1.0.1
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
b2sums_x86_64=('b42ec17c4f90b84733d11a38bc547cfbb74edb3cb6b442429684a393adbf48f2b10f499c76ce1b8c1a3501047787ccdb1b5449b626b60a995bdccb610de3dc6a')
b2sums_aarch64=('e1e1321da5a39a8badd38e86e25a369352e4370f4d64d1ccbd071362e48509a4340b71edced57791015b08e749840f780758a5de3e86eebda6954f1788ec14e3')

package() {
    if [[ "$CARCH" == "aarch64" ]]; then
        suffix="arm64"
    else
        suffix="amd64"
    fi
    install -Dm755 "zenta-v${pkgver}-linux-${suffix}" "$pkgdir/usr/bin/zenta"
    install -Dm644 zenta-LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
