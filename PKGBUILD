# Maintainer: r3f <r3flector@pm.me>

pkgname=warp-terminal-dev-bin
_upstream=warp-terminal-dev
pkgver=0.2026.04.29.08.57.dev_00
pkgrel=1
pkgdesc="Warp, the Rust-based terminal for developers and teams (nightly/dev channel)"
arch=('x86_64')
url='https://warp.dev'
license=('custom')
depends=(
    'curl'
    'default-cursors'
    'fontconfig'
    'libegl'
    'libx11'
    'libxcb'
    'libxcursor'
    'libxi'
    'libxkbcommon-x11'
    'opengl-driver'
    'xdg-utils'
    'zlib'
)
optdepends=(
    'adwaita-cursors: for if there is no default cursor installed'
    'zenity: for file dialogs in Gnome'
    'kdialog: for file dialogs in KDE'
    'org.freedesktop.secrets: for securely storing passwords'
)
provides=("${_upstream}=${pkgver}")
conflicts=("${_upstream}")
options=('!strip' '!debug')
source=("${_upstream}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst::https://releases.warp.dev/dev/v${pkgver}/${_upstream}-v${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
sha256sums=('f489f2df36816d0107682cdf4124667647a4bcdcbd0aa6a3c9ea716df22e1348')

package() {
    bsdtar -xf "${srcdir}/${_upstream}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}"
    rm -f "${pkgdir}/.BUILDINFO" "${pkgdir}/.MTREE" "${pkgdir}/.PKGINFO"
}
