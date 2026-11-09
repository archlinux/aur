# Maintainer: Adil Bouzit <adil.bouzit@gmail.com>
pkgname=epicgames-proton
pkgver=0.1.0
pkgrel=2
pkgdesc="Run Epic Games Launcher with GE-Proton, with an update dialog, health check and rollback"
arch=('any')
url="https://gitlab.com/S-Zilean/epicgames-proton"
license=('MIT')
depends=(
    'bash' 'coreutils' 'curl' 'findutils' 'grep' 'procps-ng' 'python' 'sed' 'tar' 'util-linux'
    'vulkan-icd-loader' 'lib32-vulkan-icd-loader' 'lib32-glibc' 'zenity' 'hicolor-icon-theme'
)
optdepends=(
    'libnotify: desktop notifications'
    'polkit: create the install folder when its parent needs admin rights'
    'lib32-gnutls: TLS for the launcher under Wine'
    'vulkan-driver: Vulkan driver for your GPU'
    'lib32-vulkan-driver: 32-bit Vulkan driver for your GPU'
)
source=("$pkgname-v$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('433e38e1604df2102d44e1c4574a177e21c9a0968f9262b15f1bc64c76eb9c8a')

package() {
    cd "$pkgname-v$pkgver"
    install -Dm755 epicgames-proton "$pkgdir/usr/bin/epicgames-proton"
    install -Dm644 epicgames-proton.desktop "$pkgdir/usr/share/applications/epicgames-proton.desktop"
    install -Dm644 epicgames-proton.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/epicgames-proton.svg"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
