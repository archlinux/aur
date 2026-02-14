# Maintainer: NotMugil notmugil01@gmail.com
pkgname=hardcover-tui-bin
pkgver=1.0.0
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
sha256sums_x86_64=('265b7ee9110ecf419c933e31c68e76634658858c7c207a32a33dd0954748f2f3')
sha256sums_aarch64=('1d852153f5a0a81485d352ac5d9425ee266c178b670d5b28b7dd58e142a97e67')

package() {
    install -Dm755 hardcover-tui "${pkgdir}/usr/bin/hardcover-tui"

    # Install license if present in the archive
    if [[ -f LICENSE ]]; then
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
