# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="figurine"
pkgname="${_pkgname}-bin"
pkgver=1.3.0
pkgrel=2
pkgdesc="Print your text in style"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://github.com/arsham/${_pkgname}"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux_arm64_v${pkgver}.tar.gz")
source_armv7h=("${_pkgsrc}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux_arm_v${pkgver}.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux_amd64_v${pkgver}.tar.gz")
sha256sums=('18daeccc025edb298d9d8fbd13652a31add19c0d410c5d7e6b23a8cf4edf0404'
            '07944e5d027ada147fa405b891016d1c180a22b7bed0a306a4019157725dac1e')
sha256sums_aarch64=('c49d0eb3d6e84a14c6e76c553f7c57b1ed3ce61fca1f3c7ce39f95c2a5a99329')
sha256sums_armv7h=('427686f46cf4548b7d0f52cc8077bbb1812b38c148fea0352fe73e582f2d489c')
sha256sums_x86_64=('e72430de0ca4b4b4548495d803856f5fec223f43c59a97a0bfcc714710d5032a')

package() {
  cd "${srcdir}"
  install -vDm755 "deploy/${_pkgname}"   "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
