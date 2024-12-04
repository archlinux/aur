# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="firectl"
pkgname="${_pkgname}-bin"
pkgver=0.2.0
pkgrel=1
pkgdesc="A command-line tool to run Firecracker microVMs"
arch=('x86_64')
url="https://github.com/firecracker-microvm/${_pkgname}"
license=('Apache-2.0')
depends=('firecracker' 'glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}")
sha256sums=('830c8eea1495eac47300d018b5001b9283f5846a357ae6aec9ebf7ed1e2d1ed1'
            '09e8a9bcec8067104652c168685ab0931e7868f9c8284b66f5ae6edae5f1130b')
sha256sums_x86_64=('860f9152eac534317d367648107a04ae350b00b1d575cac6ddf691f169a45c6a')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
