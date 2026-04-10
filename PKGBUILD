pkgname=warp-terminal-autoup-bin
_pkgname=warp-terminal
pkgver=0.2026.04.08.08.36.stable_02
pkgrel=1
pkgdesc='Warp, the Rust-based terminal for developers and teams'
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
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')
source=(
  "${_pkgname}-v${pkgver}-1-x86_64.pkg.tar.zst::https://releases.warp.dev/stable/v${pkgver}/${_pkgname}-v${pkgver}-1-x86_64.pkg.tar.zst"
)
noextract=("${_pkgname}-v${pkgver}-1-x86_64.pkg.tar.zst")
sha256sums=('c7b6ce656194bcb0f4e4aafa92f1eb52a650a48e287012fc10a187a920128e94')

package() {
  local _upstream_pkg="${_pkgname}-v${pkgver}-1-x86_64.pkg.tar.zst"

  bsdtar \
    --exclude '.BUILDINFO' \
    --exclude '.MTREE' \
    --exclude '.PKGINFO' \
    -xpf "${srcdir}/${_upstream_pkg}" \
    -C "${pkgdir}"
}
