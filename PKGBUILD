# Maintainer: Matvel007
pkgname=tidy-cleaner-bin
_pkgname=tidy-cleaner
pkgver=0.2.0
pkgrel=1
pkgdesc="Modern, ultra-fast, and safe system cleaner, manager, and hardware telemetry dashboard for Linux (precompiled binary)"
arch=('x86_64')
url="https://github.com/Matvel007/Tidy-Cleaner"
license=('MIT')
depends=('gcc-libs' 'glibc' 'fontconfig')
optdepends=(
    'polkit: Elevated privilege actions (system-wide uninstallation)'
    'nvidia-utils: GPU telemetry for NVIDIA graphics cards'
    'flatpak: Flatpak application management'
    'snapd: Snap application management'
    'yay: AUR package management'
    'paru: AUR package management'
)
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/tidy-cleaner-v$pkgver-linux-x86_64.tar.gz")
sha256sums_x86_64=('aa1fbf73743821afe52d67d63600274848077a80d22bba8fd8d833a229d505e3')

package() {
    cd "$srcdir/tidy-cleaner"
    install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    install -Dm644 "$_pkgname.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
    install -Dm644 "$_pkgname.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"
}
