# Maintainer: neur0map <90535780+neur0map@users.noreply.github.com>
pkgname=gpk-bin
pkgver=0.2.13
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
sha256sums_x86_64=('b44bea2982a1cd1dbaa0516ba1ffb12964d73f9b271315690571a32319a195ba')
sha256sums_aarch64=('626b81895d58eaf0189bb9b99ce84b8c1467b679783a95a511b10cfe7a64b241')

package() {
    if [[ "$CARCH" == "x86_64" ]]; then
        install -Dm755 "gpk-linux-amd64" "${pkgdir}/usr/bin/gpk"
    elif [[ "$CARCH" == "aarch64" ]]; then
        install -Dm755 "gpk-linux-arm64" "${pkgdir}/usr/bin/gpk"
    fi
}
