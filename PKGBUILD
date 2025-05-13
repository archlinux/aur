# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="gotz"
pkgname="${_pkgname}-bin"
pkgver=0.1.15
pkgrel=1
pkgdesc="A simple CLI timezone info tool"
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url="https://github.com/merschformann/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_arm64.tar.gz")
source_armv7h=("${_pkgsrc}-armv6h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_armv6.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_386.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_amd64.tar.gz")
sha256sums_aarch64=('8cd548bb713ea926f710945aad2953ed4ce41965bbd4da4237cefd2f2152f3cb')
sha256sums_armv7h=('314ac595f0b2042add0540cb1a2d0058cd9f1d252c8b351b2f8a726007f9d092')
sha256sums_i686=('bcb2bbbbd0df13102f791e19f3318c1a0e50963299b86190d751b11b31e99f2a')
sha256sums_x86_64=('2a2766c2e96407ddd2be8bc1e6da5d234251b80c2df77b034d58d1862996372f')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
