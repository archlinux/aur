# Maintainer: NotMugil notmugil01@gmail.com
pkgname=hardcover-tui-bin
pkgver=1.0.2
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
sha256sums_x86_64=('19a7a6f3042eb090f4facc3591a92f8dba002760fefb523f94f16d6b689fe5ef')
sha256sums_aarch64=('6aa2ef05f0b88a18b740a396d30d05a1e5c7f97a095475e67364faf3f59cb66f')

package() {
    install -Dm755 hardcover-tui "${pkgdir}/usr/bin/hardcover-tui"

    # Install license if present in the archive
    if [[ -f LICENSE ]]; then
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
