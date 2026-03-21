# Maintainer: neur0map <90535780+neur0map@users.noreply.github.com>
pkgname=gpk-bin
pkgver=0.2.11
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
sha256sums_x86_64=('b976a4e91df8803ebc405541e9d747f5e9a1f3e8a48cf8b9eaab3bf0ec135762')
sha256sums_aarch64=('2d2c3908405b10ccd8dd712ba53cf0907853ef99dc814ec211110a33ccb046f5')

package() {
    if [[ "$CARCH" == "x86_64" ]]; then
        install -Dm755 "gpk-linux-amd64" "${pkgdir}/usr/bin/gpk"
    elif [[ "$CARCH" == "aarch64" ]]; then
        install -Dm755 "gpk-linux-arm64" "${pkgdir}/usr/bin/gpk"
    fi
}
