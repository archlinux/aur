# Maintainer: neur0map <90535780+neur0map@users.noreply.github.com>
pkgname=gpk-bin
pkgver=0.2.14
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
sha256sums_x86_64=('efbbf2bc7955691824a1092dc83ba128ea6cff5a938db022aa90ff596a79c44a')
sha256sums_aarch64=('047f9c7510c8785b4aacd8e485b2c441297cfc6b551da856ca0e676aa2fb33e4')

package() {
    if [[ "$CARCH" == "x86_64" ]]; then
        install -Dm755 "gpk-linux-amd64" "${pkgdir}/usr/bin/gpk"
    elif [[ "$CARCH" == "aarch64" ]]; then
        install -Dm755 "gpk-linux-arm64" "${pkgdir}/usr/bin/gpk"
    fi
}
