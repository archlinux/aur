# Maintainer: NotMugil notmugil01@gmail.com
pkgname=hardcover-tui-bin
pkgver=1.1.0
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
sha256sums_x86_64=('6b76bf7d9494b9380fb5ae2e36ebc3d7126eaae39aeb6b90a319f4dfd835aa71')
sha256sums_aarch64=('6831558374f1d22352ab3709367f754287a39dcfe06319e204bc78695710c02a')

package() {
    install -Dm755 hardcover-tui "${pkgdir}/usr/bin/hardcover-tui"

    # Install license if present in the archive
    if [[ -f LICENSE ]]; then
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
