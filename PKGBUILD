# Maintainer:  Arnau Camprubí <arnauxabia@gmail.com>
# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="hevi"
pkgname="${_pkgname}-bin"
pkgver=1.1.0
pkgrel=1
pkgdesc="A modern hex viewer"
arch=('x86_64' 'aarch64')
url="https://arnau478.github.io/${_pkgname}"
_url="https://github.com/Arnau478/${_pkgname}"
license=('GPL-3.0-or-later')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${_url}/raw/refs/tags/v${pkgver}/LICENSE"
        "${_pkgsrc}.man.1::${_url}/raw/refs/tags/v${pkgver}/doc/${_pkgname}.1.man"
        "${_pkgsrc}.man.5::${_url}/raw/refs/tags/v${pkgver}/doc/${_pkgname}.5.man")
source_x86_64=("${_pkgsrc}-x86_64::${_url}/releases/download/v${pkgver}/${_pkgname}-x86_64-linux")
source_aarch64=("${_pkgsrc}-aarch64::${_url}/releases/download/v${pkgver}/${_pkgname}-aarch64-linux")
b2sums=('f73b30f9459f0e2c6112fa01b3494c42628c1716245e75616dc409c083d330b517b12a77dfd8e5422764af820a1cf292921f8268ec637e92357efc517d7a144d'
        '74915e048cf8b5207abf603136e7d5fcf5b8ad512cce78a2ebe3c88fc3150155893bf9824e6ed6a86414bbe4511a6bd4a42e8ec643c63353dc8eea4a44a021cd'
        'b30b73f7440925f70705877ec19c6c45bbd91784b83d61c01b8ba2114ffe9119c82b7319a5bde4d7afcd5f74da89f9513b04aa5bf41168712f239bb39e14ba18'
        '395d0a014a0d7ab7c531b1f04ad6111414b4d2ab47566a13737cf43f613029d08b7a250cef3ef718eb81b00cb9b6f2104335f3f425686e1d1d5d0726d3a06a08')
b2sums_x86_64=('58ac5f4cc104305775c3662f02c545bba96407ec3f562a579014194bc36bfba1f2ddbf48fd305f86b066e652de66f724b467404129b9cfc3db57ed7656cce43b')
b2sums_aarch64=('93656a1f80ebd822a3fc3164d9559942873632dfa989158c843226c4a1f4f883db023db880a5e1836455b59796a6e7115b915165aac6c7a0203f100311c47ca6')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -vDm644 "${_pkgsrc}.man.1"    "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
  install -vDm644 "${_pkgsrc}.man.5"    "${pkgdir}/usr/share/man/man5/${_pkgname}.5"
}
