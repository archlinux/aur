# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstream_author=Mjoyufull
_upstream_name=fsel
_execname=fsel

pkgname=fsel-bin
pkgver=3.4.1
pkgrel=1
pkgdesc="Fast TUI app launcher and fuzzy finder for GNU/Linux and *BSD (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/${_upstream_author}/${_upstream_name}"
license=('BSD-2-Clause')

depends=('glibc' 'libgcc')
provides=("fsel=${pkgver}")
conflicts=('fsel')
options=('!strip')

source_x86_64=(
  "${_upstream_name}-${pkgver}-x86_64-unknown-linux-gnu.tar.xz::https://github.com/${_upstream_author}/${_upstream_name}/releases/download/${pkgver}/${_upstream_name}-x86_64-unknown-linux-gnu.tar.xz"
)
source_aarch64=(
  "${_upstream_name}-${pkgver}-aarch64-unknown-linux-gnu.tar.xz::https://github.com/${_upstream_author}/${_upstream_name}/releases/download/${pkgver}/${_upstream_name}-aarch64-unknown-linux-gnu.tar.xz"
)

sha256sums_x86_64=(
  '62ede54ea3e30ae00b378bf7337f0e6ec1cbbb32f328d06cbd9084622e31e2d4'
)
sha256sums_aarch64=(
  '52ddb8ed51216646bf6f13722719bd57bf26c4cee32286bf44fea7005dcb1df6'
)

package() {
  local _bindir="${srcdir}/${_upstream_name}-${CARCH}-unknown-linux-gnu"

  install -Dm755 "${_bindir}/${_execname}" "${pkgdir}/usr/bin/${_execname}"
  install -Dm644 "${_bindir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${_bindir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
