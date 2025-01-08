# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Maintainer:  Andrei Embarque <andreijosee@zoho.com>

_pkgname="doom_ascii"
pkgname="${_pkgname}-bin"
pkgver=0.2.1
pkgrel=1
pkgdesc="Text-based DOOM in your terminal! Source-port of doomgeneric. Does not have sound."
arch=('x86_64')
url="https://github.com/wojciech-graj/doom-ascii"
license=('GPL-2.0-or-later')
depends=('glibc' 'sh')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgname}.sh"
        "README-${pkgver}.md::${url}/raw/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_linux_v${pkgver//./_}.zip")
sha256sums=('27864d019900aa0728c95d77e70dfd94869e44a65e6657ef04110c5f5c1cc202'
            '53c60df8d3ae1538477615426685ee1d277fb3207f3e6cb24a0c427f5a4a942b'
            '8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643')
sha256sums_x86_64=('6bbc4b07165d24a08a2a4003275f51514e96cc654e0a95700ebf42e9fd072716')
backup=("opt/${_pkgname}/.default.cfg")

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}.sh"      "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm755 "${_pkgname}"         "${pkgdir}/opt/${_pkgname}/${_pkgname}"
  install -Dm644 ".default.cfg"        "${pkgdir}/opt/${_pkgname}/.default.cfg"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
