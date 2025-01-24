# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="clai"
pkgname="${_pkgname}-bin"
pkgver=1.6.1
pkgrel=1
pkgdesc="Command line artificial intelligence - Multi-vendor generation in your terminal"
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/baalimago/${_pkgname}"
license=('MIT')
depends=('glibc')
optdepends=('glow: for formatted markdown output when querying text responses')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "EXAMPLES-${pkgver}.md::${url}/raw/refs/tags/v${pkgver}/EXAMPLES.md"
        "LICENSE-${pkgver}::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_aarch64=("${_pkgsrc}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}_linux-arm64_v${pkgver}")
source_i686=("${_pkgsrc}-i686::${url}/releases/download/v${pkgver}/${_pkgname}_linux-386_v${pkgver}")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}_linux-amd64_v${pkgver}")
sha256sums=('edaddad56f51f8043c5e27ffa63c02038d0ef62e28f61912b80034419219a893'
            '49521c29eb1889889064b16a4fce2e79abb54b520a1545000f22f71678d53046'
            'bc5378230a80daace8ac9ea68f538fb33997fd2abf0fa5d91905365b6b8924dc')
sha256sums_aarch64=('52d14b25d3f7861f3871c633d932bcdde12ceda3726cb416171f28a96bd2c8e5')
sha256sums_i686=('488ed1e4f5511c8dccac5322b79e4a3a15cdbf01a12ec18d13f83938e21aa121')
sha256sums_x86_64=('db0aea7b08edcb0964987faddb2f2689090f5363d57a7997938bc380b6a893d4')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"   "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README-${pkgver}.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "EXAMPLES-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/EXAMPLES.md"
  install -vDm644 "LICENSE-${pkgver}"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
