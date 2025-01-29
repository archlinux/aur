# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="deck"
pkgname="${_pkgname}-bin"
pkgver=1.43.1
pkgrel=1
pkgdesc="Configuration management and drift detection for Kong and Kong Enterprise"
arch=('x86_64' 'aarch64')
url="https://github.com/Kong/${_pkgname}"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
b2sums_x86_64=('9cde994e7c4b78237dbd9d6e0e9460746af255fca0205e82af278587bfa8f33f54ee145980acce27d413bc0421cfb29e907186485bae6663cb1cbd2fac41747b')
b2sums_aarch64=('d9cf0ae48a022af69359fda0d2d86727774865415c4bd57a99cbb8deedcb939a25e6a1a1084509b627c90aea8a9690a92ec9c8ed9e968b303a03a887a2ecfa1e')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
