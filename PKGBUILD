# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=msoap
_pkgname=html2data
pkgname=${_pkgname}-bin
pkgdesc="CLI for extracting data from HTML via CSS selectors"

pkgver=1.2.3
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'i686' 'aarch64')
_barch=('amd64' '386' 'arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_linux_${_barch[0]}.tar.gz")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_linux_${_barch[1]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_linux_${_barch[2]}.tar.gz")
sha256sums_x86_64=('f0e6a9bd09138bbf04fdb4cdcf28012a940b61d42ecf5c2b69a89d07654d3232')
sha256sums_i686=('bcd390b4ce434c2a63d24a43fa52b45a6c0d4ee9b0063aabb91745e8b14c9366')
sha256sums_aarch64=('151c59271bd976b30cd8b839b081471efa15d87846e47590d27bfe06fbba989a')


package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/bin/"

  install -Dm644 "${_pkgname}.1" -t "${pkgdir}/usr/share/man/man1/"

  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"

  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
