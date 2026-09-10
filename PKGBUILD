# Maintainer: Hewel <13846369+hewel@users.noreply.github.com>

pkgname=jellypilot-bin
pkgver=2.2.0
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
sha256sums=('98e568d9a6d600103691f6bc9f5eb62ab4477b2c963f9b4d3bfdf9b6ce7702c7')

package() {
  bsdtar -x \
    --exclude='.BUILDINFO' \
    --exclude='.MTREE' \
    --exclude='.PKGINFO' \
    -C "$pkgdir" \
    -f "$srcdir/$pkgname-$pkgver.pkg.tar.zst"
}
