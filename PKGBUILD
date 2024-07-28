# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="omm"
pkgname="${_pkgname}-bin"
pkgver=0.4.3
pkgrel=1
pkgdesc="A keyboard-driven task manager for the command line"
arch=('x86_64' 'i686' 'aarch64')
url="https://tools.dhruvs.space/${_pkgname}"
_url="https://github.com/dhth/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('a168e2852b8b5c5fa7c118731cd2b8074ac23f99c399f865cc56f896a2798a04')
sha256sums_i686=('506f2187f7162b09d927f8b92047d9523b702eea7199e01ea34830524de4db1e')
sha256sums_aarch64=('73e07978ab9142c5c49d41a7bec280690880291d28164009b71b874d5ff94d37')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
