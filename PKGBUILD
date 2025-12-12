# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="tartrazine"
pkgname="${_pkgname}-bin"
pkgver=0.18.0
pkgrel=1
pkgdesc="A Crystal reimplementation of the Pygments/Chroma syntax highlighters"
arch=('aarch64' 'x86_64')
url="https://github.com/ralsina/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${url##*/}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-CHANGELOG.md::${url}/raw/refs/tags/v${pkgver}/CHANGELOG.md"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_aarch64=("${_pkgsrc}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}-static-linux-arm64")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-static-linux-amd64")
sha256sums=('0832d35f478bfa74aea707443fcc87aeae50a0f20900d8e9f04fd4bfa01efdf3'
            'fca530d60f6b53a2e56c38ba3b126c0ba6df98df41d438087630b57d86c3f61c'
            'dbbffa23a676d422aa7460b468c731e4fe3a007414e14d787a3d3f3fb55b1713')
sha256sums_aarch64=('b6cc07e97c5df45befa1786d51ae043c4606b2f94087f37d9ce8e2adbc74a39d')
sha256sums_x86_64=('5d27f4058944beab3b92f9156a9243cf4843f7b3216cbbf6e43aef164b96348e')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
