# Maintainer: NotMugil notmugil01@gmail.com
pkgname=hardcover-tui-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="An unofficial TUI client for Hardcover - the social book tracking platform"
arch=('x86_64' 'aarch64')
url="https://github.com/NotMugil/hardcover-tui"
license=('AGPL-3.0-or-later')
depends=('glibc')
optdepends=(
    'gnome-keyring: GNOME keyring backend'
    'kwallet: KDE Wallet keyring backend'
)
provides=('hardcover-tui')
conflicts=('hardcover-tui')

source_x86_64=("${url}/releases/download/v${pkgver}/hardcover-tui_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/hardcover-tui_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('b3b322058c3c10949c4bb8b694ae1ebe8d2bdf8517e36593ad227a234227a0fa')
sha256sums_aarch64=('12090deb967d0649d824b055c99fc37574ff220daa511231d59d638cc8dc222f')

package() {
    install -Dm755 hardcover-tui "${pkgdir}/usr/bin/hardcover-tui"

    # Install license if present in the archive
    if [[ -f LICENSE ]]; then
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
