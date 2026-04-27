# Maintainer: VincentZyu <vincentzyu233@gmail.com>
pkgname=winload-rust-bin
pkgver=0.1.8.rc.10
pkgrel=1
pkgdesc="A lightweight, real-time CLI tool for monitoring network bandwidth and traffic"
arch=('x86_64' 'aarch64')
url="https://github.com/VincentZyuApps/winload"
license=('MIT')
provides=('winload')
conflicts=('winload' 'winload-rust')
_tagver=0.1.8-rc.10
_base_url="https://github.com/VincentZyuApps/winload/releases/download/v${_tagver}"
source_x86_64=("winload-linux-x86_64-v${_tagver}::${_base_url}/winload-linux-x86_64-v${_tagver}")
source_aarch64=("winload-linux-aarch64-v${_tagver}::${_base_url}/winload-linux-aarch64-v${_tagver}")
noextract=()
sha256sums_x86_64=('83b39d546268c724a3a5d1f343b953ff3f919cda2f7914d8c40735531d8f5fd2')
sha256sums_aarch64=('1b6631d641e6d14a88f342452a8e65f0ea385ffad75e886e2bb07887a7e6a831')

package() {
    if [[ "$CARCH" == "x86_64" ]]; then
        install -Dm755 "$srcdir/winload-linux-x86_64-v${_tagver}" "$pkgdir/usr/bin/winload"
    elif [[ "$CARCH" == "aarch64" ]]; then
        install -Dm755 "$srcdir/winload-linux-aarch64-v${_tagver}" "$pkgdir/usr/bin/winload"
    fi
}
