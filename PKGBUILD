# Maintainer: Matvel007
pkgname=tidy-cleaner-bin
_pkgname=tidy-cleaner
pkgver=0.1.1
pkgrel=1
pkgdesc="Modern, ultra-fast, and safe system cleaner, manager, and hardware telemetry dashboard for Linux (precompiled binary)"
arch=('x86_64')
url="https://github.com/Matvel007/Tidy-Cleaner"
license=('MIT')
depends=('gcc-libs' 'glibc')
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
sha256sums_x86_64=('22a804b0ccdb5b837e2572cbb29be797250a627db0d8669f959153db62b71057')

package() {
    cd "$srcdir/tidy-cleaner"
    install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    install -Dm644 "$_pkgname.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
    install -Dm644 "$_pkgname.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"
}
