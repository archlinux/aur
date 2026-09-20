# Maintainer: Hewel <13846369+hewel@users.noreply.github.com>

pkgname=jellypilot-bin
pkgver=2.2.2
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
# Verified against the final GitHub release SHA256SUMS and downloaded artifact.
sha256sums=('be031aca4c16851df89be88876cacf9f7a7acce87d8f6c8bcefb972c9206446f')

package() {
  bsdtar -x \
    --exclude='.BUILDINFO' \
    --exclude='.MTREE' \
    --exclude='.PKGINFO' \
    -C "$pkgdir" \
    -f "$srcdir/$pkgname-$pkgver.pkg.tar.zst"
}
