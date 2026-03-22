# Maintainer: neur0map <90535780+neur0map@users.noreply.github.com>
pkgname=gpk-bin
pkgver=0.2.12
pkgrel=1
pkgdesc="TUI dashboard that unifies 34 package managers into one searchable view"
arch=('x86_64' 'aarch64')
url="https://github.com/neur0map/glazepkg"
license=('GPL-3.0-or-later')
depends=()
provides=('gpk')
conflicts=('gpk')
source_x86_64=("${url}/releases/download/v${pkgver}/gpk-linux-amd64")
source_aarch64=("${url}/releases/download/v${pkgver}/gpk-linux-arm64")
sha256sums_x86_64=('4585e8ad168e57089210098be22f0c891ce6cd1bb42a0c6587b53b8ad5433700')
sha256sums_aarch64=('f2101ea21e89bd5271863c604c41a1021cec71cc29a8aa08263cab4fece07d85')

package() {
    if [[ "$CARCH" == "x86_64" ]]; then
        install -Dm755 "gpk-linux-amd64" "${pkgdir}/usr/bin/gpk"
    elif [[ "$CARCH" == "aarch64" ]]; then
        install -Dm755 "gpk-linux-arm64" "${pkgdir}/usr/bin/gpk"
    fi
}
