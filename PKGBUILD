# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname=figurine
pkgname=${_pkgname}-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Print your text in style"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/arsham/${_pkgname}"
license=('Apache')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${url}/raw/v${pkgver}/README.md"
        "${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux_amd64_v${pkgver}.tar.gz")
source_aarch64=("${_pkgsrc}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux_arm64_v${pkgver}.tar.gz")
source_armv7h=("${_pkgsrc}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux_arm_v${pkgver}.tar.gz")
sha256sums=('18daeccc025edb298d9d8fbd13652a31add19c0d410c5d7e6b23a8cf4edf0404'
            '07944e5d027ada147fa405b891016d1c180a22b7bed0a306a4019157725dac1e')
sha256sums_x86_64=('e72430de0ca4b4b4548495d803856f5fec223f43c59a97a0bfcc714710d5032a')
sha256sums_aarch64=('c49d0eb3d6e84a14c6e76c553f7c57b1ed3ce61fca1f3c7ce39f95c2a5a99329')
sha256sums_armv7h=('427686f46cf4548b7d0f52cc8077bbb1812b38c148fea0352fe73e582f2d489c')

package() {
  cd "${srcdir}"
  install -Dm755 "deploy/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}