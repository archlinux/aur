# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Maintainer:  Andrei Jose R. Embarque <andreijosee@zoho.com>

_pkgname="doom_ascii"
__pkgname="doom-ascii"
pkgname="${_pkgname}-bin"
pkgver=0.3.1
pkgrel=1
pkgdesc="DooM in the terminal!"
arch=('x86_64')
url="https://github.com/wojciech-graj/doom-ascii"
license=('GPL-2.0-or-later')
depends=('glibc' 'sh')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgname}.sh"
        "README-${pkgver}.md::${url}/raw/${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64-linux.zip::${url}/releases/download/${pkgver}/${__pkgname}-${pkgver//_/-}-x86_64-linux.zip")
sha256sums=('27864d019900aa0728c95d77e70dfd94869e44a65e6657ef04110c5f5c1cc202'
            '0c1a2eb8f0332fc43ae3843c6d14de6e2fba8a02cfa04103fe095a71358a3883'
            '8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643')
sha256sums_x86_64=('1dfb81d3b86ab42738f6c93eb7293001945a04a0185b9d2df0832d5162d95102')
backup=("opt/${_pkgname}/.default.cfg")

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}.sh"      "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm755 "${__pkgname}"         "${pkgdir}/opt/${_pkgname}/${_pkgname}"
  install -Dm644 ".default.cfg"        "${pkgdir}/opt/${_pkgname}/.default.cfg"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
