# Maintainer: NotMugil notmugil01@gmail.com
pkgname=hardcover-tui-bin
pkgver=1.0.3
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
sha256sums_x86_64=('1b21d5544f4d47cb40636706b08df155a6a65ea0c9127b998895de315ed779fd')
sha256sums_aarch64=('f90cd47f40ef7e69d4721f5ba6f0b923c2884e10736a1587d9cf27a672daef47')

package() {
    install -Dm755 hardcover-tui "${pkgdir}/usr/bin/hardcover-tui"

    # Install license if present in the archive
    if [[ -f LICENSE ]]; then
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
