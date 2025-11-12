# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="xtxf"
pkgname="${_pkgname}-bin"
pkgver=0.11.5
pkgrel=1
pkgdesc="The Matrix screensaver in Zig"
arch=(
  'aarch64'
  'i686'
  'x86_64'
)
url="https://github.com/charlesrocket/${_pkgname}"
license=(
  'BSD-2-Clause'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-CHANGELOG.md::${url}/raw/refs/tags/${pkgver}/CHANGELOG.md"
  "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/${pkgver}/LICENSE"
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/${pkgver}/README.md"
)
source_aarch64=(
  "${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/${pkgver}/${_pkgname}-aarch64-linux.tar.gz"
)
source_i686=(
  "${_pkgsrc}-i686.tar.gz::${url}/releases/download/${pkgver}/${_pkgname}-x86-linux.tar.gz"
)
source_x86_64=(
  "${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/${pkgver}/${_pkgname}-x86_64-linux.tar.gz"
)
sha256sums=('e988659f8752707a905a33f74076e55447aa7f032c7d76b965e0a9cd4f616967'
            'ec5609e070efc1a3493b50874f310662ffdcfc9e21378a1d46b9c30e4390bffc'
            '1f8a9bfdab4012649b39eb48b5ae9715dbe70da13e3eb8af18c2fda88315c73d')
sha256sums_aarch64=('58cd8b9637e09a130f71b37d6b9dd1061596b229c87afae743e14036499edf14')
sha256sums_i686=('a8141067e6b8491c2b36874d874db8a4c3dbe0c606d45ab868936f6d79f1ab20')
sha256sums_x86_64=('bb525a79d5b758c31f2c29c80d377bd69cf714a0727701337a8c5a1d1a56ccb8')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-CHANGELOG.md" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"
  install -vDm644 "${_pkgsrc}-LICENSE"      "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -vDm644 "${_pkgsrc}-README.md"    "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
