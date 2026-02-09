pkgname=warp-terminal-autoup-bin
_pkgname=warp-terminal
pkgver=0.2026.02.04.08.20.stable_03
pkgrel=1
pkgdesc='Warp, the Rust-based terminal for developers and teams'
arch=('x86_64')
url='https://warp.dev'
license=('custom')
depends=(
)
optdepends=(
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')
source=(
  "${_pkgname}-v${pkgver}-1-x86_64.pkg.tar.zst::https://releases.warp.dev/stable/v${pkgver}/${_pkgname}-v${pkgver}-1-x86_64.pkg.tar.zst"
)
noextract=("${_pkgname}-v${pkgver}-1-x86_64.pkg.tar.zst")
sha256sums=('ab69eb9786c8e11d93d2e94a72fd479908d882edf5b5b98bdb64e003ff89e573')

package() {
  local _upstream_pkg="${_pkgname}-v${pkgver}-1-x86_64.pkg.tar.zst"

  bsdtar \
    --exclude '.BUILDINFO' \
    --exclude '.MTREE' \
    --exclude '.PKGINFO' \
    -xpf "${srcdir}/${_upstream_pkg}" \
    -C "${pkgdir}"
}
