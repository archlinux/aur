# Maintainer: Adil Bouzit <adil.bouzit@gmail.com>
pkgname=battlenet-proton
pkgver=0.4.0
pkgrel=1
pkgdesc="Run Battle.net with GE-Proton, with an update dialog, health check and rollback"
arch=('any')
url="https://gitlab.com/S-Zilean/battlenet-proton"
license=('MIT')
depends=(
    'bash' 'coreutils' 'curl' 'findutils' 'grep' 'procps-ng' 'python' 'sed' 'tar' 'util-linux'
    'vulkan-icd-loader' 'lib32-vulkan-icd-loader' 'lib32-glibc' 'zenity' 'hicolor-icon-theme'
)
optdepends=(
    'libnotify: desktop notifications'
    'polkit: create the install folder when its parent needs admin rights'
    'lib32-gnutls: TLS for Battle.net under Wine'
    'vulkan-driver: Vulkan driver for your GPU'
    'lib32-vulkan-driver: 32-bit Vulkan driver for your GPU'
)
source=("$pkgname-v$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('1bf6d5148b28897feb44a76ec3e0c56cf114763b781a408b1b2129593b272e9c')

package() {
    cd "$pkgname-v$pkgver"
    install -Dm755 battlenet-proton "$pkgdir/usr/bin/battlenet-proton"
    install -Dm644 battlenet-proton.desktop "$pkgdir/usr/share/applications/battlenet-proton.desktop"
    install -Dm644 battlenet-proton.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/battlenet-proton.svg"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
