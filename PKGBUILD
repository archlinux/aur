# Maintainer: Valhallab <contact at valhallab dot com>
# shellcheck shell=bash
# shellcheck disable=SC2034,SC2154

pkgname=overcrow-bin
pkgver=0.1.0prealpha5
pkgrel=1
_release=v0.1.0-pre-alpha.5
pkgdesc='Opt-in external Linux game overlay by PlayerVox'
arch=('x86_64')
url='https://github.com/Valhallab/PlayerVox-OverCrow'
license=('AGPL-3.0-only')
depends=('glibc' 'gcc-libs' 'systemd' 'libx11' 'libxcb' 'libxkbcommon' 'wayland' 'mesa' 'xdg-desktop-portal' 'xdg-utils' 'gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
optdepends=('hyprland: Hyprland overlay integration' 'plasma-workspace: Plasma overlay integration' 'gnome-shell: GNOME Wayland overlay integration')
provides=('overcrow')
conflicts=('overcrow')
options=('!debug' '!strip')
install=overcrow.install

_source="${pkgname}-${pkgver}-${pkgrel}-upstream-x86_64.pkg.tar.zst"
source_x86_64=("${_source}::${url}/releases/download/${_release}/${pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${_source}")
sha256sums_x86_64=('f39133b67356b09a3a439dc50eeedf5b887a9b419f5871986308402a8b85b1a7')

package() {
    bsdtar -xf "$srcdir/$_source" -C "$pkgdir" usr
}
