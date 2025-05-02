# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="omm"
pkgname="${_pkgname}-bin"
pkgver=0.6.0
pkgrel=1
pkgdesc="A keyboard-driven task manager for the command line"
arch=('aarch64' 'i686' 'x86_64')
url="https://tools.dhruvs.space/${_pkgname}"
_url="https://github.com/dhth/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_arm64.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_386.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_amd64.tar.gz")
sha256sums_aarch64=('825e44b3f017252fe7ebb20883dfc1c66d7a918516a84b38ab75e09b394659cb')
sha256sums_i686=('9f091ec89c149300b5dcd8916a1836086e8b20c4be30c589b38fa61409d5eaf9')
sha256sums_x86_64=('73e77d5ad963b6ab31c5a1eb16df5fc1bd972fe5cc7917b45c84c4bcf4b4035f')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
