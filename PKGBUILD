# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="slackdump"
pkgname="${_pkgname}-bin"
pkgver=3.1.3
pkgrel=1
pkgdesc="Save your private and public Slack messages, threads, files, and users locally"
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/rusq/${_pkgname}"
license=('GPL-3.0-only')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_arm64.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_i386.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_x86_64.tar.gz")
b2sums_aarch64=('b1041c3a1db43709200885e4b82e538077ea2dfc5d25276fbf5ac76d533a81f61eea3e9f5e8eb578b48d2fb2437653513b9eb93aed59f4d15da35f9cfff9edb1')
b2sums_i686=('a071a7a69de458b88cfa113cd8eb5948e65331f009ad9b12044129d1fd597983101cc1ba7186d8c5c949f14631d98ea1e1d3cef0efe7fb61b87db9aec168e4aa')
b2sums_x86_64=('96927c763dcf1a6be9960ee4a5007d022e1f3dcff56ad870d6a408347b7b6d3b04e0ab59eeabb6d26ee5f9f98615bf1f8641be5b4dfccb622f81e89a92fec0e3')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}"   "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"     "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"       "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -vDm644 "${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}
