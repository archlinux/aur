# Maintainer: dim <mlrudasill@gmail.com>

pkgname='astramarket-bin'
pkgver=1.1.0
pkgrel=1
pkgdesc='Unified Linux marketplace with Flatpak, Pacman, AUR, and AppImage support (precompiled binary)'
arch=('x86_64')
url='https://github.com/dim-ghub/AstraMarket'
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-declarative' 'qt6-shadertools' 'qt6-svg')
optdepends=('flatpak: Flatpak package support'
            'paru: AUR package support'
            'yay: AUR package support'
            'pacman: Pacman package support')
provides=('astramarket' 'astra')
conflicts=('astramarket' 'astramarket-git')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/astra-v$pkgver-linux-x86_64.tar.gz")
sha256sums=('81686ca8b5db6618a3b7563166046b0ec9bcada3420ec9abb23eab01cc16a081')

package() {
    cd "${srcdir}/astra-v${pkgver}-linux-x86_64"
    install -Dm755 bin/astra "$pkgdir"/usr/bin/astra
    install -Dm644 share/applications/astra.desktop "$pkgdir"/usr/share/applications/astra.desktop
    install -Dm644 share/icons/hicolor/scalable/apps/AstraMarket.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/AstraMarket.svg
    install -Dm644 share/icons/hicolor/scalable/apps/tray-dark.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/tray-dark.svg
    install -Dm644 share/icons/hicolor/scalable/apps/tray-light.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/tray-light.svg
    install -Dm644 share/polkit-1/actions/com.astramarket.pacman.policy "$pkgdir"/usr/share/polkit-1/actions/com.astramarket.pacman.policy
    install -Dm644 share/polkit-1/rules.d/10-astramarket-pacman.rules "$pkgdir"/usr/share/polkit-1/rules.d/10-astramarket-pacman.rules
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
