# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="doom_ascii"
pkgname="${_pkgname}-bin"
pkgver=0.1.1
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
            'b89d9d29bf5e3989086c68f702ab9ac0eac2cba1d5af01d40776fa143511b54b'
            '8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643')
sha256sums_x86_64=('e4e47a6e0d0308d1f25e60868cd8eafb164b58bfbb941f2b49d1a0e1fb60bafd')
backup=("opt/${_pkgname}/.default.cfg")

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}.sh"      "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm755 "${_pkgname}"         "${pkgdir}/opt/${_pkgname}/${_pkgname}"
  install -Dm644 ".default.cfg"        "${pkgdir}/opt/${_pkgname}/.default.cfg"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
