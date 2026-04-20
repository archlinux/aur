# Maintainer: fibsussy <fibsussy@tuta.io>
pkgname=crosshair-maker
pkgver=0.1.5
pkgrel=1
pkgdesc="Crosshair overlay creator with SVG rendering and preview"
arch=('x86_64' 'aarch64')
url="https://github.com/fibsussy/crosshair-maker"
license=('GPL-3.0-only')
depends=('libx11' 'libxcb' 'wayland' 'libxkbcommon' 'vulkan-icd-loader')
makedepends=()
options=('!debug')
install=crosshair-maker.install

_arch="$CARCH"
if [ "$_arch" = "x86_64" ]; then
    _arch="x86_64"
elif [ "$_arch" = "aarch64" ]; then
    _arch="aarch64"
fi

source=(
    "https://github.com/fibsussy/crosshair-maker/releases/download/v${pkgver}/crosshair-maker-${pkgver}-${_arch}.tar.gz"
    "LICENSE::https://raw.githubusercontent.com/fibsussy/crosshair-maker/v${pkgver}/LICENSE"
    "crosshair-maker.desktop::https://raw.githubusercontent.com/fibsussy/crosshair-maker/v${pkgver}/assets/crosshair-maker.desktop"
    "crosshair-maker.png::https://raw.githubusercontent.com/fibsussy/crosshair-maker/v${pkgver}/assets/crosshair-maker.png"
    "crosshair-maker.install::https://raw.githubusercontent.com/fibsussy/crosshair-maker/v${pkgver}/crosshair-maker.install"
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
    install -Dm755 "$srcdir/crosshair-maker" "$pkgdir/usr/bin/crosshair-maker"
    install -Dm644 "$srcdir/crosshair-maker.desktop" "$pkgdir/usr/share/applications/crosshair-maker.desktop"
    install -Dm644 "$srcdir/crosshair-maker.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/crosshair-maker.png"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/crosshair-maker/LICENSE"
}
