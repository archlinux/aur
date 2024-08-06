# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="caido-cli"
pkgname="${_pkgname}-bin"
pkgver=0.40.0
pkgrel=1
pkgdesc="A lightweight web security auditing toolkit"
arch=('x86_64' 'aarch64')
url="https://caido.io"
_url="https://github.com/caido/caido"
license=('custom')
depends=('glibc' 'gcc-libs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${_url}/raw/v${pkgver}/README.md")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::https://storage.googleapis.com/caido-releases/v${pkgver}/${_pkgname}-v${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::https://storage.googleapis.com/caido-releases/v${pkgver}/${_pkgname}-v${pkgver}-linux-aarch64.tar.gz")
sha256sums=('c2d91ad17ee7a2a8a706c0caf28ef6bc92dd98c5e1012e4ec7ba5af3a3982a8f')
sha256sums_x86_64=('1bcb20fb70a9f509128a267cd74cf88c27c6bc425414ba2b293d09987acee80a')
sha256sums_aarch64=('28d44af3073e6d20e62e1213a876a8ec29b99509b165ba4ba33a344468f73025')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}"         "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
