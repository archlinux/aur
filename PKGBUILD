# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="omekasy"
pkgname="${_pkgname}-bin"
pkgver=1.3.0
pkgrel=1
pkgdesc="Convert alphanumeric characters to various styles defined in Unicode"
arch=('x86_64')
url="https://github.com/ikanago/${_pkgname}"
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_x86_64=("${_pkgsrc}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('8d07c0fe49474d794f83fd455784201117a33f7062e18df9b6c13a6826c18e5c')

package() {
  cd "${srcdir}/archive"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
