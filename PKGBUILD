# Maintainer: Esperadoce <https://github.com/Esperadoce>
pkgname=hypricing-bin
pkgver=0.7
pkgrel=1
pkgdesc="GUI settings manager for Hyprland (pre-built binary)"
arch=('x86_64')
url="https://github.com/Esperadoce/Hypricing"
license=('MIT')
provides=('hypricing')
conflicts=('hypricing' 'hypricing-git')
source=("hypricing-${pkgver}-linux-x64.tar.gz::https://github.com/Esperadoce/Hypricing/releases/download/v${pkgver}/hypricing-v${pkgver}-linux-x64.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir"
    install -Dm755 Hypricing.Desktop       "$pkgdir/usr/lib/hypricing/hypricing"
    install -Dm755 libSkiaSharp.so         "$pkgdir/usr/lib/hypricing/libSkiaSharp.so"
    install -Dm755 libHarfBuzzSharp.so     "$pkgdir/usr/lib/hypricing/libHarfBuzzSharp.so"
    install -dm755                          "$pkgdir/usr/bin"
    ln -s /usr/lib/hypricing/hypricing     "$pkgdir/usr/bin/hypricing"
}
