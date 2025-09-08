# Maintainer: Aaron Roque Fonseca <aaronroquefonseca@gmail.com>
pkgname=orca-slicer-flatpak-bin
pkgver=2.3.0
pkgrel=1
pkgdesc="OrcaSlicer Flatpak package tracking the stable release (uninstall with \`flatpak uninstall --user io.github.softfever.OrcaSlicer\`)"
arch=('x86_64' 'aarch64')
url="https://github.com/SoftFever/OrcaSlicer"
license=('AGPL3')
depends=('flatpak')
makedepends=()
source=("https://github.com/SoftFever/OrcaSlicer/releases/download/v${pkgver}/OrcaSlicer-Linux-flatpak_V${pkgver}_${CARCH}.flatpak")
sha256sums=('SKIP') #I wanted to support aarch64, so it was either not using checksums or downloading both flatpak files.

package() {
    # Uninstall existing Flatpak first (if any)
    flatpak uninstall --user --assumeyes io.github.softfever.OrcaSlicer 2>/dev/null || true

    # Install the correct Flatpak for this architecture
    flatpak install --user --assumeyes "${srcdir}/OrcaSlicer-Linux-flatpak_V${pkgver}_${CARCH}.flatpak"
}

