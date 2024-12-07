# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Paul Nicholson <brenix@gmail.com>

_pkgname="variant"
pkgname="${_pkgname}-bin"
pkgdesc="Turn your bash scripts into a modern, single-executable CLI app today"
pkgver=0.38.0
pkgrel=1
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/mumoshu/${_pkgname}"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_amd64.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_arm64.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_386.tar.gz")
sha256sums_x86_64=('d95d7f63d06fa33f43d334b55da4ca1b3e434a50444f540acb43cdf1cecf4bb2')
sha256sums_i686=('60defe9c7723f54a29c57780fbf3de18c2bf592de82f8fc2b13cd5404ed7bc90')
sha256sums_aarch64=('5811a4318a152f39eea9a2e2c8851acfe971c6e7618924de0b0c34b00cbcefd2')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
