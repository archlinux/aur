# Maintainer: Roberto Gogoni <robertogogoni@gmail.com>
pkgname=wayland-cedilla-fix
pkgver=1.0.0
pkgrel=1
pkgdesc="Fix cedilla (ç) on Wayland compositors — makes ' + c produce ç instead of ć"
arch=('any')
url="https://github.com/robertogogoni/wayland-cedilla-fix"
license=('MIT')
depends=('bash' 'xkeyboard-config')
optdepends=(
    'fcitx5: full input method support (recommended)'
    'fcitx5-gtk: GTK integration for fcitx5'
    'fcitx5-qt: Qt integration for fcitx5'
    'libxkbcommon: live Compose table verification (xkbcli)'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/robertogogoni/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 cedilla-fix.sh "${pkgdir}/usr/bin/cedilla-fix"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
