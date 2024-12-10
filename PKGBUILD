# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="drand"
pkgname="${_pkgname}-bin"
pkgver=2.0.5
pkgrel=1
pkgdesc="A Distributed Randomness Beacon Daemon"
arch=('x86_64' 'aarch64' 'i686')
url="https://drand.love"
_url="https://github.com/${_pkgname}/${_pkgname}"
license=('Apache-2.0 OR MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_amd64.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_arm64.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_386.tar.gz")
sha256sums_x86_64=('1d0fe3238ae5d19a0e2fc56b514f1329b86e769c0b0de84026b9d0ce63f69150')
sha256sums_aarch64=('229dd1cfeea54fb32c740ddb665f2443f9985202f73ab6cb0e6f796ac7a6d174')
sha256sums_i686=('bdfede066c1e2e82cc2503c1cf70be53e24c44aa9e29fbe15694e5629fdf3b55')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}"    "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"      "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-APACHE-2.0"
  install -vDm644 "LICENSE-MIT"    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"
}
