# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="oxker"
pkgname="${_pkgname}-bin"
pkgver=0.13.2
pkgrel=1
pkgdesc="A simple TUI to view & control Docker containers"
arch=(
  'aarch64'
  'armv7h'
  'x86_64'
)
url="https://github.com/mrjackwills/${_pkgname}"
license=(
  'MIT'
)
depends=(
  'docker'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE"
)
source_aarch64=(
  "${_pkgname}_${pkgver}_linux_aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux_aarch64.tar.gz"
)
source_armv7h=(
  "${_pkgname}_${pkgver}_linux_armv6.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux_armv6.tar.gz"
)
source_x86_64=(
  "${_pkgname}_${pkgver}_linux_x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux_x86_64.tar.gz"
)
sha256sums=('3c6d5ca4c89e0f1820b5717504f560fe91a39d300a0fd9d17ea84b38cee74bb3'
            'b73cb1c664857dc71c358b7127f3601be7d625fa97fa2d7e3b1e09381e4d98f0')
sha256sums_aarch64=('d28adead20ef1f30818088b993f7b2f036ddb6ec11e8f96803bbe7f0ff1a1ba0')
sha256sums_armv7h=('d13454004a8bb2c44c3e5caee9aaa1cbface389db479af0f94dd7dd69bc2ec23')
sha256sums_x86_64=('3775979640701248ff8e7bbb597a6dadc6cd05f8ee9cdfa6a82feb52b8f4dcbd')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}"          "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
