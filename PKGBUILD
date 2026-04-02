# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="autocast"
pkgname="${_pkgname}-bin"
pkgver=0.1.0
pkgrel=2
pkgdesc="A tool to help automate the creation of terminal demos"
arch=(
  'x86_64'
)
url="https://github.com/k9withabone/${_pkgname}"
license=(
  'GPL-3.0-or-later'
)
depends=(
  'glibc'
  'libgcc'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
source_x86_64=(
  "${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.xz::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.tar.xz"
)
sha256sums_x86_64=('c236e53dc51a1b01d74291e6ade778f23903cb30eded5d3e63bfb1c1f70d9336')

package() {
  cd "${srcdir}/${_pkgname}-${CARCH}-unknown-linux-gnu"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
