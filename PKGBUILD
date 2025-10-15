# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="docker-language-server"
pkgname="${_pkgname}-bin"
pkgver=0.20.1
pkgrel=1
pkgdesc="Language server for Dockerfiles, Compose files, and Bake files"
arch=('aarch64' 'x86_64')
url="https://github.com/docker/${_pkgname}"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${pkgver}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_aarch64=("${_pkgsrc}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64-v${pkgver}")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64-v${pkgver}")
sha256sums=('f3cfac035d392f415d911a3c3bddf24b50af06b0ee171ee4948f5b619a15f085'
            '7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8')
sha256sums_aarch64=('bd56c7815e0a22cfb708669f3d5e817de91d9b54039ff7e52867142a132ad8d7')
sha256sums_x86_64=('01907aa5b0eae11e44cffea0a993d08aa155542a9af570295dd1dff39e67692a')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
