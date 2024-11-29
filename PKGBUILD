# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="asciigen"
pkgname="${_pkgname}-bin"
pkgver=1.0.4
pkgrel=1
pkgdesc="Convert images/video to ASCII art"
arch=('x86_64' 'aarch64')
url="https://github.com/seatedro/${_pkgname}"
license=('MIT')
depends=('ffmpeg4.4' 'glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/refs/tags/v${pkgver}/readme.md"
#        "LICENSE-${pkgver}::${url}/raw/refs/tags/v${pkgver}/LICENSE")
        "LICENSE-${pkgver}::${url}/raw/38240db30522b10a7dcee1e62a0a568d89ef5f06/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-linux")
source_aarch64=("${_pkgsrc}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}-aarch64-linux")
b2sums=('92c45d45df93abc554d21fcef24396641793ed5cc91ab1ca614ead400c49891f1b60c76e7821b8730f823b0ba6b7519038b42bb4133a91fad3ea32727d2e4570'
        '6e30329dd26cee83c8466084acbe1c8ab3d1f9bcd025b4e224e3f727fd8a23a22ebbfe6d52e92fc0ffa8d9aa5113b8cd1775ec7523c4563702d7ee16c8ef0598')
b2sums_x86_64=('d83a541a183975245a40c432a575ba2eaa8168528d04a8d24bc173dc426825b98a24d0a727c5d6fa1577fd16d1ae96621f0c340c9cc90b37815fb80c210db790')
b2sums_aarch64=('5d9418c1caecdf1b926a86f3196a442b84918f298529a6bd307cf4364e396126de0007405321a427be1b48c62117f316c0d4d5f2676f3d005beefd33ee538407')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
