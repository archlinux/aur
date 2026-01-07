# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: MidAutumnMoon <mid.autumn0moon@gmail.com>

_pkgauthor=ameshkov
_pkgname=dnslookup
pkgname=${_pkgname}-bin
pkgver=1.11.2
pkgrel=1
pkgdesc='Simple command line utility to make DNS lookups to the specified server'

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"

arch=('x86_64' 'i686' 'aarch64')
license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64-v${pkgver}.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}-linux-386-v${pkgver}.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64-v${pkgver}.tar.gz")
sha256sums_x86_64=('65ef7fbd8b17fe6a1591a2df9408bf21f9ac60b6c213bc9131fdddb095c91932')
sha256sums_i686=('c63dda98495b3e91dbf6a1bee6915bef0cd01d9482a016670d64b3a4bfae8c56')
sha256sums_aarch64=('266362cb8340fc8a713f51a4ff38851579d6f58fc75e9a37c2b1ae074caf907d')


package() {
  cd "${srcdir}/linux-"* || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
