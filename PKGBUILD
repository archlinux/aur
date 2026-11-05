# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="gphotos-uploader-cli"
pkgname="${_pkgname}-bin"
pkgver=6.0.0
pkgrel=1
pkgdesc="Command line tool to mass upload media folders to your Google Photos account(s)"
arch=(
  'x86_64'
)
url="https://gphotosuploader.github.io/gphotos-uploader-cli/"
_url="https://github.com/gphotosuploader/${_pkgname}"
license=(
  'MIT'
)
depends=(
  'glibc'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
source_x86_64=(
  "${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz"
)
sha256sums_x86_64=('2ea95f14843688284460aedb2e926421661f9794a51943f892431ff364e39f48')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -vDm644 "CHANGELOG.md" "README.md" -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -vDm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
