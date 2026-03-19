# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstream_author=Mjoyufull
_upstream_name=fsel
_execname=fsel

pkgname=fsel-bin
pkgver=3.3.0
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
  'd8c07ca128c908e3e7f5c91e48fb23cb79d52ec87bfde697517f9ff35595c776'
)
sha256sums_aarch64=(
  '22989d804ee0d37062af5a61a72e34b4d6d2ab1c6ce4335e26ba3a909d5d5b16'
)

package() {
  local _bindir="${srcdir}/${_upstream_name}-${CARCH}-unknown-linux-gnu"

  install -Dm755 "${_bindir}/${_execname}" "${pkgdir}/usr/bin/${_execname}"
  install -Dm644 "${_bindir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${_bindir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
