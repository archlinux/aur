# Maintainer: VincentZyu <vincentzyu233@gmail.com>
pkgname=winload-rust-bin
pkgver=0.1.12.rc.5
pkgrel=1
pkgdesc="A lightweight, real-time CLI tool for monitoring network bandwidth and traffic"
arch=('x86_64' 'aarch64')
url="https://github.com/VincentZyuApps/winload"
license=('MIT')
provides=('winload')
conflicts=('winload' 'winload-rust')
_tagver=0.1.12-rc.5
_base_url="https://github.com/VincentZyuApps/winload/releases/download/v${_tagver}"
source_x86_64=("winload-linux-x86_64-v${_tagver}::${_base_url}/winload-linux-x86_64-v${_tagver}")
source_aarch64=("winload-linux-aarch64-v${_tagver}::${_base_url}/winload-linux-aarch64-v${_tagver}")
noextract=()
sha256sums_x86_64=('64529d87745d2324a203c1709b6489b9b5f4f5b910b089a8da1af3d6f4e10ae4')
sha256sums_aarch64=('d5ef3ce4be3df10e0d654f6b19eb765f5344f89178fa5320af945ee7c4131916')

package() {
    if [[ "$CARCH" == "x86_64" ]]; then
        install -Dm755 "$srcdir/winload-linux-x86_64-v${_tagver}" "$pkgdir/usr/bin/winload"
    elif [[ "$CARCH" == "aarch64" ]]; then
        install -Dm755 "$srcdir/winload-linux-aarch64-v${_tagver}" "$pkgdir/usr/bin/winload"
    fi
}
