# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="keyb"
pkgname="${_pkgname}-bin"
pkgver=0.8.0
pkgrel=1
pkgdesc="Create and view your own custom hotkey cheatsheet in the terminal"
arch=(
  'aarch64'
  'i686'
  'x86_64'
)
url="https://github.com/kencx/${_pkgname}"
license=(
  'MIT'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
source_aarch64=(
  "${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-arm64.tar.gz"
)
source_i686=(
  "${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-386.tar.gz"
)
source_x86_64=(
  "${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-amd64.tar.gz"
)
sha256sums_aarch64=('f2b4f4724608f853d7d4a7c6c7e0ad261399eba5f50b53e22812a17705ac0649')
sha256sums_i686=('02d6e58822280a37aa949632c13c06f504fff36db673c610865c7a726740805a')
sha256sums_x86_64=('9f29517304635158a5febb3effe0c19deb1f8601a1d726451065fe2383c96287')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -vDm644 "README.md"   -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -vDm644 "LICENSE"     -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
