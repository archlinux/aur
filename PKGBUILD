# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname=gotz
pkgname=${_pkgname}-bin
pkgver=0.1.9
pkgrel=1
pkgdesc="CLI timezone info"
arch=('x86_64' 'aarch64')
url="https://github.com/merschformann/${_pkgname}"
license=('MIT')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${url}/raw/v${pkgver}/README.md"
        "${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}::${url}/releases/download/v${pkgver}/${_pkgname}_linux_amd64")
source_aarch64=("${_pkgsrc}::${url}/releases/download/v${pkgver}/${_pkgname}_linux_arm64")
sha256sums=('a0ecbb377bb12a4feb4703766256cd3f3cb27670da2f6f61b49cb2746fff6850'
            'a9ccb268af303bba78392743f2a6025e23506f52cb1b472b2d52345198aafd88')
sha256sums_x86_64=('99e870ecce0a0bf28e04940c4daaaf1461b185b926c91624118c9ff829a5f4fd')
sha256sums_aarch64=('5ef7fc0220ac6e400410f29896677e2d9dbcd497750873cffe4e1a1fa053dc48')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgsrc}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}