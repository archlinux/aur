# Maintainer: dim <mlrudasill@gmail.com>

pkgname='astramarket-bin'
pkgver=1.0.1
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
sha256sums=('977caaea4f885e42190af24530f83dd33747bbbef62b893f784dfd03211cdb61')

package() {
    cd "${srcdir}/astra-v${pkgver}-linux-x86_64"
    install -Dm755 bin/astra "$pkgdir"/usr/bin/astra
    install -Dm644 share/applications/astra.desktop "$pkgdir"/usr/share/applications/astra.desktop
    install -Dm644 share/icons/hicolor/scalable/apps/AstraMarket.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/AstraMarket.svg
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
