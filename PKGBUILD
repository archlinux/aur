# Maintainer: VincentZyu <vincentzyu233@gmail.com>
pkgname=winload-rust-bin
pkgver=0.1.10.beta.1
pkgrel=1
pkgdesc="A lightweight, real-time CLI tool for monitoring network bandwidth and traffic"
arch=('x86_64' 'aarch64')
url="https://github.com/VincentZyuApps/winload"
license=('MIT')
provides=('winload')
conflicts=('winload' 'winload-rust')
_tagver=0.1.10-beta.1
_base_url="https://github.com/VincentZyuApps/winload/releases/download/v${_tagver}"
source_x86_64=("winload-linux-x86_64-v${_tagver}::${_base_url}/winload-linux-x86_64-v${_tagver}")
source_aarch64=("winload-linux-aarch64-v${_tagver}::${_base_url}/winload-linux-aarch64-v${_tagver}")
noextract=()
sha256sums_x86_64=('c1e41a01436e3c84aedcdb8b35d3bd1a0a439f6875d1cc4f103ce997a7ed39aa')
sha256sums_aarch64=('0eec86372f0e78ea6e6e69aa22b9732e9128dd572a653d8b9b61ef79ea3d9da2')

package() {
    if [[ "$CARCH" == "x86_64" ]]; then
        install -Dm755 "$srcdir/winload-linux-x86_64-v${_tagver}" "$pkgdir/usr/bin/winload"
    elif [[ "$CARCH" == "aarch64" ]]; then
        install -Dm755 "$srcdir/winload-linux-aarch64-v${_tagver}" "$pkgdir/usr/bin/winload"
    fi
}
