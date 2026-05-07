# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="figurine"
pkgname="${_pkgname}-bin"
pkgver=2.0.0
pkgrel=1
pkgdesc="Print your text in style"
arch=(
  'aarch64'
  'armv7h'
  'x86_64'
)
url="https://github.com/arsham/${_pkgname}"
license=(
  'Apache-2.0'
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
  "${url}/releases/download/v${pkgver}/${_pkgname}_linux_arm64_v${pkgver}.tar.gz"
)
source_armv7h=(
  "${url}/releases/download/v${pkgver}/${_pkgname}_linux_arm_v${pkgver}.tar.gz"
)
source_x86_64=(
  "${url}/releases/download/v${pkgver}/${_pkgname}_linux_amd64_v${pkgver}.tar.gz"
)
sha256sums=('1fa417a9f62603dc5b70041d15a3a73cb4301bda6a39c7ddf1905823910a4c85'
            '07944e5d027ada147fa405b891016d1c180a22b7bed0a306a4019157725dac1e')
sha256sums_aarch64=('f8738fb7945ccd6161e6b6d6acaa32d744b2dafff17205bd899f551746f09521')
sha256sums_armv7h=('bd42cd763c76a30517f113776c105499d68477c55ceb624b7c3180d3900551ba')
sha256sums_x86_64=('01f125d9aa9f4a87f9f86f7eb1322b586869b3ba9b94a90af57cb7a8f03f8674')

package() {
  cd "${srcdir}"
  install -vDm755 "deploy/${_pkgname}"   "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
