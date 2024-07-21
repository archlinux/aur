# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="omekasy"
pkgname="${_pkgname}-bin"
pkgver=1.3.1
pkgrel=1
pkgdesc="Convert alphanumeric characters to various styles defined in Unicode"
arch=('x86_64')
url="https://github.com/ikanago/${_pkgname}"
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('fd4f32a0bf57f1d4fa0dc7f3425d9b46201c01152d7225ae7eb6b4bc2891e384')

package() {
  cd "${srcdir}/archive"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
