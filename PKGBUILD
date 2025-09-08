# Maintainer: Aaron Roque Fonseca <aaronroquefonseca@gmail.com>
pkgname=orca-slicer-flatpak-bin
pkgver=2.3.0
pkgrel=1
pkgdesc="OrcaSlicer Flatpak package for the stable release"
arch=('x86_64' 'aarch64')
url="https://github.com/SoftFever/OrcaSlicer"
license=('AGPL3')
depends=('flatpak')

# Arch-specific sources
source_x86_64=("https://github.com/SoftFever/OrcaSlicer/releases/download/v${pkgver}/OrcaSlicer-Linux-flatpak_V${pkgver}_x86_64.flatpak")
source_aarch64=("https://github.com/SoftFever/OrcaSlicer/releases/download/v${pkgver}/OrcaSlicer-Linux-flatpak_V${pkgver}_aarch64.flatpak")

# Arch-specific SHA256 checksums (replace 'SKIP' with real sums if desired)
sha256sums_x86_64=('e11a76d29dafc02bad5e527967b2dcc11b581677747767dd0dd24e679e2ebd41')
sha256sums_aarch64=('a8fab49a337cf3e5fdc5a9175c6cf0e90278d4647a9a6c3a32913ee7d288e735')

package() {
    # Install the Flatpak for the current architecture
    flatpak install --user --assumeyes "${srcdir}/OrcaSlicer-Linux-flatpak_V${pkgver}_${CARCH}.flatpak"
}

