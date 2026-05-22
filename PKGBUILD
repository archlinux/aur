# Maintainer: VincentZyu <vincentzyu233@gmail.com>
pkgname=winload-rust-bin
pkgver=0.1.8.rc.31
pkgrel=1
pkgdesc="A lightweight, real-time CLI tool for monitoring network bandwidth and traffic"
arch=('x86_64' 'aarch64')
url="https://github.com/VincentZyuApps/winload"
license=('MIT')
provides=('winload')
conflicts=('winload' 'winload-rust')
_tagver=0.1.8-rc.31
_base_url="https://github.com/VincentZyuApps/winload/releases/download/v${_tagver}"
source_x86_64=("winload-linux-x86_64-v${_tagver}::${_base_url}/winload-linux-x86_64-v${_tagver}")
source_aarch64=("winload-linux-aarch64-v${_tagver}::${_base_url}/winload-linux-aarch64-v${_tagver}")
noextract=()
sha256sums_x86_64=('b21026c067393e81a55ec83097ae92397383f56ed401e23fe174222d517c85a4')
sha256sums_aarch64=('cb52b902fe029c58971925df909681b2dd65d25d0701fd55dc4da71743cfa803')

package() {
    if [[ "$CARCH" == "x86_64" ]]; then
        install -Dm755 "$srcdir/winload-linux-x86_64-v${_tagver}" "$pkgdir/usr/bin/winload"
    elif [[ "$CARCH" == "aarch64" ]]; then
        install -Dm755 "$srcdir/winload-linux-aarch64-v${_tagver}" "$pkgdir/usr/bin/winload"
    fi
}
