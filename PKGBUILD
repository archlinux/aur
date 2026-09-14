# Maintainer: Hewel <13846369+hewel@users.noreply.github.com>

pkgname=jellypilot-bin
pkgver=2.2.1
pkgrel=1
pkgdesc='Jellyfin and Emby companion app with embedded MPV from the pinned mpv fork (prebuilt binary)'
arch=('x86_64')
url='https://github.com/hewel/jellypilot'
license=('MIT')
depends=(
  'gtk3'
  'libxkbcommon'
  'wayland'
  'ffmpeg'
  'libplacebo'
  'libass'
  'vulkan-icd-loader'
)
optdepends=(
  'mpv: External MPV Playback'
)
provides=('jellypilot')
conflicts=('jellypilot')
options=('!strip' '!debug')
_pkgrel=1
source=(
  "$pkgname-$pkgver.pkg.tar.zst::$url/releases/download/v$pkgver/jellypilot-$pkgver-$_pkgrel-x86_64.pkg.tar.zst"
)
noextract=("$pkgname-$pkgver.pkg.tar.zst")
# Filled from the GitHub release SHA256SUMS when publishing to the AUR.
sha256sums=('8187731b0e6d39c9ed34118bc577daaafa0c3e15675ded55047878636b2bddf9')

package() {
  bsdtar -x \
    --exclude='.BUILDINFO' \
    --exclude='.MTREE' \
    --exclude='.PKGINFO' \
    -C "$pkgdir" \
    -f "$srcdir/$pkgname-$pkgver.pkg.tar.zst"
}
