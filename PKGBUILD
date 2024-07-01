# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Kunal Dandekar

_pkgname="tcli"
pkgname="${_pkgname}-bin"
pkgver=0.4.0
pkgrel=1
pkgdesc="A utility app to help creating cogs for TCore"
arch=('x86_64')
url="https://github.com/Tectone23/${_pkgname}"
license=('MIT')
depends=('glibc' 'gcc-libs' 'openssl')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${url}/raw/v${pkgver}/README.md"
        "${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}::${url}/releases/download/v${pkgver}/${_pkgname}-linux-x86_64")
sha256sums=('aff263afff885b6aa50a4288e09b04bced71d56b6394024e8e7a1adb5e95d896'
            '01c198eea2bf253b7cb742ce385051e847a1d7bad5cee72bf8ba175d73286000')
sha256sums_x86_64=('d8b7724d993b319275e1a5f8f5b70f0d0ef04ae6aa4687363ac787fef8ab9731')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgsrc}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
