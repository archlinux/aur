# Maintainer: Mylloon <aur@mylloon.fr>

# shellcheck disable=SC2034,SC2148,SC2154

_pkgname=hearthstone-linux-gui

pkgname="${_pkgname}"-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="Native GTK4 desktop manager for installing, updating, logging into, and launching Hearthstone"
arch=('x86_64')
url="https://github.com/DawnMagnet/hearthstone-linux-gui"
license=('MIT')
depends=('glibc' 'libadwaita' 'gtk4' 'glib2' 'dbus' 'xdg-utils')
provides=("$pkgname")
conflicts=("$pkgname" "$_pkgname-appimage")
options=(!strip)
source_x86_64=(
  "${_pkgname}-${pkgver}-x86_64.pkg.tar.zst::https://github.com/DawnMagnet/hearthstone-linux-gui/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1-x86_64-native.pkg.tar.zst"
)
sha256sums_x86_64=('SKIP')


package() {
  bsdtar \
    --exclude=.PKGINFO \
    --exclude=.MTREE \
    -xf "${srcdir}/${_pkgname}-${pkgver}-x86_64.pkg.tar.zst" \
    -C "${pkgdir}"
}
