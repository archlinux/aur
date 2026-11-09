# Maintainer: Adil Bouzit <adil.bouzit@gmail.com>
pkgname=gog-galaxy-proton
pkgver=0.1.0
pkgrel=2
pkgdesc="Run GOG Galaxy with GE-Proton, with an update dialog, health check and rollback"
arch=('any')
url="https://gitlab.com/S-Zilean/gog-galaxy-proton"
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
sha256sums=('d6454ca0c8f3ebebb2b6e7109d1dc235ca181ba04705183324524da006a9fa71')

package() {
    cd "$pkgname-v$pkgver"
    install -Dm755 gog-galaxy-proton "$pkgdir/usr/bin/gog-galaxy-proton"
    install -Dm644 gog-galaxy-proton.desktop "$pkgdir/usr/share/applications/gog-galaxy-proton.desktop"
    install -Dm644 gog-galaxy-proton.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/gog-galaxy-proton.svg"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
