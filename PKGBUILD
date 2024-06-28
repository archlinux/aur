# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="wiper"
pkgname="${_pkgname}-bin"
pkgver=0.2.1
pkgrel=1
pkgdesc="Disk analyser and cleanup tool"
arch=('x86_64')
url="https://github.com/ikebastuz/${_pkgname}"
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${url}/raw/v${pkgver}/README.md"
        "${url}/raw/v${pkgver}/License")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('9ef95b7d6df6a3ec143212acf5a2fa9601de2ccc804081f038f72ee2cf03d6d9'
            'ee1a3a006e00338961551c13aaa4cdc5e4ae7367ea89f417f6cc06c3d8747da9')
sha256sums_x86_64=('1acfe5e6ea3c5b9f09993123c7fb8918d05b903f1f9e915f4f267ab5eb98c5bd')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "License" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
