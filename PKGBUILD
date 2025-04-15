# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="drand"
pkgname="${_pkgname}-bin"
pkgver=2.1.1
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
sha256sums_aarch64=('0f18dfd805e490dda16076273631c4ae42f5c9693685834354e14b4cbde74f54')
sha256sums_i686=('95bf9ec3e987bf03a047fe906476076061cf73c6e5237592bd2f4b739ba88649')
sha256sums_x86_64=('f1670d3e7951c38a201451cc7d52dfa67f84d019d7da466d0f45ca4c4a962981')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}"    "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"      "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-APACHE-2.0"
  install -vDm644 "LICENSE-MIT"    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"
}
