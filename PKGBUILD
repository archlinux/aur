# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="tartrazine"
pkgname="${_pkgname}-bin"
pkgver=0.14.2
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
sha256sums=('fcc9dd5190332c9138e34c5999ac385fb273d1108490e30aa0b219cb23fb500c'
            '6a8993bc8ae3cdff7ab9ae4e8acc087bfd74f71ab21155c0abd1a95bbd2d1917'
            'dbbffa23a676d422aa7460b468c731e4fe3a007414e14d787a3d3f3fb55b1713')
sha256sums_aarch64=('de371261c3649f7315ea8ca6db51ea7f5dc7348f5d30b2e7bbee348c6a6e9a64')
sha256sums_x86_64=('c4ecce321bd3d1d92cf04c2287445c0c55f8d59d0bce86743ac3e8b4799c0152')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
