# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="twad"
pkgname="${_pkgname}-bin"
pkgver=0.22.1
pkgrel=1
pkgdesc="Manage DOOM engines and mods with the terminal wad launcher"
arch=('x86_64')
url="https://github.com/zmnpl/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${url}/raw/v${pkgver}/"{README.md,LICENSE})
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}")
sha256sums=('306d459fe20f06668b71d5890c3f882dc33d8d4129d95957e13590bf7f973f5d'
            '9894c7a8db2482af976d25348ef173529a16ae8cf210bd7689601fc578657f33')
sha256sums_x86_64=('c188b0e547e1727ca798bbb628fa01e9f14d18ac19f82b59e35f7aac167c5da4')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
