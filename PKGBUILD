# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstream_author=Mjoyufull
_upstream_name=fsel
_execname=fsel

pkgname=fsel-bin
pkgver=3.2.0
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
  'de12adfc7117d5b93c41248eb2cf4a07d2a0474124d4727cc95bf6d79cdd7220'
)
sha256sums_aarch64=(
  '8c25fb40220e65570fb0b92d74b55f611d85451b83b1c1a88e977c00c60794fa'
)

package() {
  local _bindir="${srcdir}/${_upstream_name}-${CARCH}-unknown-linux-gnu"

  install -Dm755 "${_bindir}/${_execname}" "${pkgdir}/usr/bin/${_execname}"
  install -Dm644 "${_bindir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${_bindir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
