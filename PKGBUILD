# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="deck"
pkgname="${_pkgname}-bin"
pkgver=1.42.1
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
b2sums_x86_64=('49f8d3fa8502ea39f7e6fa2e88fe72b99e72ff6d5d6c4f7374e6c79ce97eb9beb5ff8ac17cf228804bfb4f4bf3e302c0e00e5b35b05ae6a9d2dfca6581bda5cf')
b2sums_aarch64=('46648d3ac01ab8dc7982af848f7d75bf38f8d834b9c1c86713bcb802551ba63ff46b3ee45f00436d22c1f3b50c439a1be5b073930268b846d8c2554b518b4799')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
