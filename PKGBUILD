# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=szktkfm
_pkgname=mdtt
pkgname=${_pkgname}-bin
pkgver=0.3.1
pkgrel=1
pkgdesc='Markdown Table Editor TUI'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'i686' 'aarch64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source_x86_64=("${_pkgname}-${pkgver}-${arch[0]}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_x86_64.tar.gz")
source_i686=("${_pkgname}-${pkgver}-${arch[1]}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_i386.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-${arch[2]}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_arm64.tar.gz")
sha256sums_x86_64=('9ab116dacf380e5d1e73a3e89303799211ba2834cff74f697b3bd0dd435f687b')
sha256sums_i686=('88eb54a78e4d75860a6ccae77e7c6b6ca6e811860558b9af7edeb4cd372a92c5')
sha256sums_aarch64=('0c61a1b400c20231ed81880f194593ac8db70e25ed2c2975e0e1fcffcab65a16')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
