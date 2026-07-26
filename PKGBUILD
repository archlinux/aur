# Maintainer: Valhallab <contact at valhallab dot com>
# shellcheck shell=bash
# shellcheck disable=SC2034,SC2154

pkgname=overcrow-bin
pkgver=0.1.0prealpha3
pkgrel=1
_release=v0.1.0-pre-alpha.3
pkgdesc='Opt-in external Linux game overlay by PlayerVox'
arch=('x86_64')
url='https://github.com/Valhallab/PlayerVox-OverCrow'
license=('AGPL-3.0-only')
depends=('glibc' 'gcc-libs' 'systemd' 'libx11' 'libxcb' 'libxkbcommon' 'wayland' 'mesa' 'xdg-desktop-portal' 'gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
optdepends=('hyprland: Hyprland overlay integration' 'plasma-workspace: Plasma overlay integration')
provides=('overcrow')
conflicts=('overcrow')
options=('!debug' '!strip')
install=overcrow.install

_source="${pkgname}-${pkgver}-${pkgrel}-upstream-x86_64.pkg.tar.zst"
source_x86_64=("${_source}::${url}/releases/download/${_release}/${pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${_source}")
sha256sums_x86_64=('db7f9f401f793ebf950a9ab34fe704013d452c05158baa9836b34f5527a87ee0')

package() {
    bsdtar -xf "$srcdir/$_source" -C "$pkgdir" usr
}
