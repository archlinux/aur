# Maintainer: VincentZyu <vincentzyu233@gmail.com>
pkgname=winload-rust-bin
pkgver=0.1.7.rc.5
pkgrel=1
pkgdesc="A lightweight, real-time CLI tool for monitoring network bandwidth and traffic"
arch=('x86_64' 'aarch64')
url="https://github.com/VincentZyuApps/winload"
license=('MIT')
provides=('winload')
conflicts=('winload' 'winload-rust')
_tagver=0.1.7-rc.5
_base_url="https://github.com/VincentZyuApps/winload/releases/download/v${_tagver}"
source_x86_64=("winload-linux-x86_64-v${_tagver}::${_base_url}/winload-linux-x86_64-v${_tagver}")
source_aarch64=("winload-linux-aarch64-v${_tagver}::${_base_url}/winload-linux-aarch64-v${_tagver}")
noextract=()
sha256sums_x86_64=('c49a39c4785f1d668eea43e588ec90d7e2bf170c87b24a441a39889ec757f136')
sha256sums_aarch64=('707e2f1289722d292ae17ac506219e31d4f75972e0eddadb7e4915a57ef3219a')

package() {
    if [[ "$CARCH" == "x86_64" ]]; then
        install -Dm755 "$srcdir/winload-linux-x86_64-v${_tagver}" "$pkgdir/usr/bin/winload"
    elif [[ "$CARCH" == "aarch64" ]]; then
        install -Dm755 "$srcdir/winload-linux-aarch64-v${_tagver}" "$pkgdir/usr/bin/winload"
    fi
}
