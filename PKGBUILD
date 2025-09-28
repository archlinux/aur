# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="oxker"
pkgname="${_pkgname}-bin"
pkgver=0.12.0
pkgrel=1
pkgdesc="A simple TUI to view & control Docker containers"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://github.com/mrjackwills/${_pkgname}"
license=('MIT')
depends=('docker')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux_aarch64.tar.gz")
source_armv7h=("${_pkgsrc}-armv6h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux_armv6.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux_x86_64.tar.gz")
sha256sums=('6bc5f1edc1ac3fb9f8a930e008f47258434ca66bed9ea4fe5adcc9b8cbe6cb07'
            'b73cb1c664857dc71c358b7127f3601be7d625fa97fa2d7e3b1e09381e4d98f0')
sha256sums_aarch64=('91d84a749114c5cdca2aaa2d65588425ea6bc2b25cda28f0ac20ac6fa7f4d613')
sha256sums_armv7h=('92a8ccc7378e92c86501cadc1275b6f43963e726bc1c4ef4c70328025d116cce')
sha256sums_x86_64=('8ceee7e9731341400a5460478125539842637da8b29bc22b6d400775c5d21715')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}"          "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
