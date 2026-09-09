# Maintainer: Hewel <13846369+hewel@users.noreply.github.com>

pkgname=jellypilot-bin
pkgver=2.1.0
pkgrel=1
pkgdesc='Jellyfin and Emby companion app: cast receiver and library browser driving external MPV (prebuilt binary)'
arch=('x86_64')
url='https://github.com/hewel/jellypilot'
license=('MIT')
depends=(
  'gtk3'
  'mpv'
  'libxkbcommon'
  'wayland'
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
sha256sums=('0713160570114690dd493330430aca5667723cbfa18d0a1edc6711294b317c41')

package() {
  bsdtar -x \
    --exclude='.BUILDINFO' \
    --exclude='.MTREE' \
    --exclude='.PKGINFO' \
    -C "$pkgdir" \
    -f "$srcdir/$pkgname-$pkgver.pkg.tar.zst"
}
