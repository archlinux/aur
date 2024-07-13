# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="twad"
pkgname="${_pkgname}-bin"
pkgver=0.30.0
pkgrel=1
pkgdesc="Manage DOOM engines and mods with the terminal wad launcher"
arch=('x86_64')
url="https://github.com/zmnpl/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README.md-${pkgver}::${url}/raw/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64.zip::${url}/releases/download/v${pkgver}/${_pkgname}-linux_v${pkgver}.zip")
sha256sums=('306d459fe20f06668b71d5890c3f882dc33d8d4129d95957e13590bf7f973f5d'
            '9894c7a8db2482af976d25348ef173529a16ae8cf210bd7689601fc578657f33')
sha256sums_x86_64=('33f8ec483594ebbcb3d2654ea4067aa4eb4ec1344249086b92e49dc916662f81')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}"         "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md-${pkgver}" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
