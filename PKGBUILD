# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="drand"
pkgname="${_pkgname}-bin"
pkgver=2.1.0
pkgrel=1
pkgdesc="A Distributed Randomness Beacon Daemon"
arch=('aarch64' 'i686' 'x86_64')
url="https://drand.love"
_url="https://github.com/${_pkgname}/${_pkgname}"
license=('Apache-2.0 OR MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_arm64.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_386.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_amd64.tar.gz")
sha256sums_aarch64=('d0fcf50dd76ace3fac75bfdbdc9665cb4176920f1127cf4232209c8ebef39e2a')
sha256sums_i686=('d4deebfc9f2dccd6e52f19441c5175fe66698aa83c144c214a94459fb4cf1c85')
sha256sums_x86_64=('8ec95d21f0e4ebd7ba2b62b9a95ceb1b9c9ddb29f1cbd6176b8175c4e7ce4e22')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}"    "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"      "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-APACHE-2.0"
  install -vDm644 "LICENSE-MIT"    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"
}
