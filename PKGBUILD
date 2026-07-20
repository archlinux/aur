# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstream_author=Mjoyufull
_upstream_name=fsel
_execname=fsel

pkgname=fsel-bin
pkgver=3.6.0
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
  'bab60dd8fcef57585458f10928b9d5bf8d1b68282d8aa22634d0813760688899'
)
sha256sums_aarch64=(
  '713830e4cd158a691e0c305891f62f9307bd48136ccdc4205a77edd0e83f8347'
)

package() {
  local _bindir="${srcdir}/${_upstream_name}-${CARCH}-unknown-linux-gnu"

  install -Dm755 "${_bindir}/${_execname}" "${pkgdir}/usr/bin/${_execname}"
  install -Dm644 "${_bindir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${_bindir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
