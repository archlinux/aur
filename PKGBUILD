# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=msoap
_pkgname=go-carpet
pkgname=${_pkgname}-bin
pkgdesc="Tool for show test coverage in terminal for Go source files"

pkgver=1.10.0
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
sha256sums_x86_64=('319d7e116493ebda1f506fb63800f2f7bab2b5dcdc9e89caf6f7f95c1b7baa2a')
sha256sums_i686=('a16473eae76270f455bb7605924e21302de93a96da40a5e0c7cc8de946adaa67')
sha256sums_aarch64=('89659c84e6714d846bb512c74cca6755a1e2cf3747fd6618341c4a956c12875c')


package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/bin/"

  install -Dm644 "${_pkgname}.1" -t "${pkgdir}/usr/share/man/man1/"

  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"

  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
