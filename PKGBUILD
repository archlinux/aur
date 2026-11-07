# Maintainer: snowballons <snowballons@protonmail.com>
pkgname=aurbreak-bin
_pkgname=aurbreak
pkgver=0.1.1
pkgrel=1
pkgdesc="A fast, offline-first desktop browser for the Arch User Repository (AUR)"
arch=('x86_64')
url="https://github.com/snowballons/AURbreak"
license=('GPL-3.0-or-later')
depends=('fontconfig' 'libxkbcommon' 'libxkbcommon-x11' 'hicolor-icon-theme')
optdepends=(
    'yay: quick AUR package installation support'
    'paru: alternative AUR helper support'
    'pikaur: alternative AUR helper support'
)
provides=('aurbreak' 'browse-arch')
conflicts=('aurbreak')
source=("${_pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('567d562b108d7219f298f3f75291e70c8c8eadaa24ed4b923356c378efa9e44f')

package() {
    cd "${srcdir}/${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu"
    install -Dm755 aurbreak "${pkgdir}/usr/bin/aurbreak"
    ln -sf aurbreak "${pkgdir}/usr/bin/browse-arch"
    install -Dm644 packaging/aurbreak.desktop "${pkgdir}/usr/share/applications/aurbreak.desktop"
    install -Dm644 ui/assets/aurbreak-icon-app.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/aurbreak.svg"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
