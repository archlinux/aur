# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="slackdump"
pkgname="${_pkgname}-bin"
pkgver=3.0.5
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
b2sums_aarch64=('b996d79e37a8b8b4e39fa0905a74dddba66de87d3fb3be2859a9f4fa26b14c03523d1d5d33f352d4d1ce9b12cb716d4bee1824e032f77df21a4e39776acb1d3a')
b2sums_i686=('8caf86145583ac49a6d978439a656a8d09552d27186cbd489471bd712febf15737b809591ae1367104f6559266a058ed5da2515e93fa4287fd3be6546089929f')
b2sums_x86_64=('2c271bff41c69e12132d088a8c98ac3bc6d3ef371fe1d6f65423b41c9ef926d9228b16016753d17c9d955884176633b823a01ebae9efe7f51f8ba15e54407220')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}"   "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"     "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"       "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -vDm644 "${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}
