# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="clai"
pkgname="${_pkgname}-bin"
pkgver=1.6.0
pkgrel=1
pkgdesc="Command line artificial intelligence - Multi-vendor generation in your terminal"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/baalimago/${_pkgname}"
license=('MIT')
depends=('glibc')
optdepends=('glow: for formatted markdown output when querying text responses')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/v${pkgver}/README.md"
        "EXAMPLES-${pkgver}.md::${url}/raw/v${pkgver}/EXAMPLES.md"
        "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}_linux-amd64_v${pkgver}")
source_i686=("${_pkgsrc}-i686::${url}/releases/download/v${pkgver}/${_pkgname}_linux-386_v${pkgver}")
source_aarch64=("${_pkgsrc}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}_linux-arm64_v${pkgver}")
sha256sums=('edaddad56f51f8043c5e27ffa63c02038d0ef62e28f61912b80034419219a893'
            '49521c29eb1889889064b16a4fce2e79abb54b520a1545000f22f71678d53046'
            'bc5378230a80daace8ac9ea68f538fb33997fd2abf0fa5d91905365b6b8924dc')
sha256sums_x86_64=('509745e4c441a7ce9829f8493264e654a0e48d116b0f09a582e0e23dbebf7f28')
sha256sums_i686=('bb59909ca981ecfa8b89efc293f702a2434c79f4450fe5f49c113e3d5dafb976')
sha256sums_aarch64=('64dcab0a6a478a98740470aeee3f123d2801f49da66d0f35eb49c4fd984a5985')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgsrc}-${CARCH}"   "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README-${pkgver}.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "EXAMPLES-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/EXAMPLES.md"
  install -Dm644 "LICENSE-${pkgver}"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
