# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="mayhem"
pkgname="${_pkgname}-bin"
pkgver=1.2.4
pkgrel=1
pkgdesc="A minimal TUI-based task tracker"
arch=(
  'aarch64'
  'x86_64'
)
url="https://github.com/BOTbkcd/${_pkgname}"
license=(
  'MIT'
)
depends=(
  'sqlite'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source_aarch64=(
  "${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64.tar.gz"
)
source_x86_64=(
  "${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64.tar.gz"
)
sha256sums_aarch64=('90e9441778feed4e21e635175f97d61cbb94a24199f1d3fed79e6d40c26d9554')
sha256sums_x86_64=('d15ff5f2c684310bd9d696656a158542b42d7d2e4b6511d59a9b4e4cd22d86ae')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
