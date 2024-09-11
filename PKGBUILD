# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="drand"
pkgname="${_pkgname}-bin"
pkgver=2.0.3
pkgrel=1
pkgdesc="A Distributed Randomness Beacon Daemon"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/${_pkgname}/${_pkgname}"
license=('Apache-2.0' 'MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('5614cca86e6794429ea7686e8892b9b2533a5a43584613a5776a45c1bf6487a2')
sha256sums_i686=('5d8f9a1866bd355693009c48cf47c8d3e1dade7523319709bacdf62c061f911f')
sha256sums_aarch64=('30fd78a6db5d26a171b0df31084790e42e021d7136c7f46006bb10e352bd0c01')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}"    "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md"      "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-APACHE-2.0"
  install -Dm644 "LICENSE-MIT"    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"
}
