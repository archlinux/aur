# Maintainer: Nasir A. <112448715+NasirA1991@users.noreply.github.com>
#
# Prebuilt binaries from GitHub Actions (Arch container) published as a GitHub
# Release in NasirA1991/satur8-aur. The .github/workflows/build-bin.yml workflow
# updates pkgver/pkgrel/sha256sums and publishes this file to the AUR.
pkgname=satur8-bin
pkgver=0.3.3
pkgrel=1
pkgdesc="Per-game digital vibrance for Linux (prebuilt binaries)"
arch=('x86_64')
url="https://github.com/NtrpyDev/satur8"
license=('GPL-3.0-or-later')
depends=('fontconfig' 'gcc-libs' 'glibc' 'hicolor-icon-theme')
optdepends=('kwin: KDE Plasma Wayland backend (saturation effect)'
            'gnome-shell: GNOME Wayland backend (Shell extension)'
            'gamescope: universal fallback backend for niche compositors'
            'nvidia-settings: NVIDIA X11 Digital Vibrance backend')
provides=('satur8')
conflicts=('satur8')
options=('!strip' '!debug')
source=("$pkgname-v$pkgver-$pkgrel-x86_64.tar.gz::https://github.com/NasirA1991/satur8-aur/releases/download/satur8-bin-v$pkgver-$pkgrel/$pkgname-v$pkgver-$pkgrel-x86_64.tar.gz")
# Replaced by the build-bin workflow with the checksum of the released tarball.
sha256sums=('64fb32bb6d2e384699493012b5136fcd154f61b72d780aca5ed86be9181f80b8')

package() {
    cp -a --no-preserve=ownership usr "$pkgdir/"
}
