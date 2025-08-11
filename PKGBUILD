# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="HyperSploit"
_pkgname="${_Name,,}"
pkgname="${_pkgname}-bin"
pkgver=1.1.0
pkgrel=1
pkgdesc="Bypasses HyperOS restrictions on bootloader unlocking"
arch=('x86_64')
url="https://github.com/TheAirBlow/${_Name}"
license=('MPL-2.0')
depends=('glibc') # 'android-tools'
provides=("${_pkgname}")
conflicts=("${_pkgname}")
# options=('!debug' '!strip')
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/${pkgver}/LICENCE")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/${pkgver}/${_Name}-Linux")
sha256sums=('7081ee4dcce9cecd248260654f992cff7f14443db4dacd185cece72e6dce483e'
            '1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5')
sha256sums_x86_64=('a92423ba1735c90ae5b59c02e915bc6171e1c66abcb838ed55904f042b46a305')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${_Name}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
