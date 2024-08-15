# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="omm"
pkgname="${_pkgname}-bin"
pkgver=0.5.1
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
sha256sums_x86_64=('e75769f9845ce0f039c59fcda9d9fe91887c4acff7bd134c638ed15d9b8268f7')
sha256sums_i686=('26ac30473657e3ec37953ed7b08da1e29b1b773f217310915d7a714a0dbdb17d')
sha256sums_aarch64=('7984d4be3ba6e8d9b30c61dbe7c9b4f74fe72946bfd731223972a307c36dd104')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
