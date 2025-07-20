# Maintainer: Comrade Freeman <mister.siroejkin at yandex.ru>
_mode=host
pkgname=plasma-wireguard-vpn
pkgdesc="Package that adds quicksettings button for Wireguard VPN"
pkgver=1.0
pkgrel=1
_arches=all
arch=(
    x86_64
    armv7h
    aarch64
)
license=("LGPL-2.0-or-later")
url="https://github.com/comradeFreeman/plasma-mobile-wireguard.git"

depends=(
    wireguard-tools
    kdialog
)

source=("git+$url")
sha256sums=(SKIP)

_srcdir=plasma-mobile-wireguard

prepare() {
    cd "$_srcdir"
}

package() {
    path="usr/share/plasma/quicksettings/org.kde.plasma.quicksetting.vpn.wg"
    install -Dm644 "$_srcdir/Messages.sh" "$pkgdir/$path/Messages.sh"
    install -Dm644 "$_srcdir/metadata.json" "$pkgdir/$path/metadata.json"
    cp -r "$_srcdir/contents" "$pkgdir/$path"
}
