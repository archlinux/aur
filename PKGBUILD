# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=hedhyw
_pkgname=json-log-viewer
_pkgexec=jlv
pkgname=${_pkgname}-bin
pkgver=1.6.0
pkgrel=1
pkgdesc='Interactive viewer for JSON logs.'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'i686' 'aarch64')
_barch=('amd64' '386' 'arm64')
license=('MIT')

depends=('glibc')
provides=("${_pkgexec}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${_pkgexec}_linux_${_barch[0]}.tar.gz")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${_pkgexec}_linux_${_barch[1]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${_pkgexec}_linux_${_barch[2]}.tar.gz")
sha256sums_x86_64=('35c1273615581d508ac7ef326a8c02abfb24c6e3f439f4d50b09771a98d7fed5')
sha256sums_i686=('d0764537640ceb8e4263636f55a2cafac78baac59d0a5ad04e044b8610a4d391')
sha256sums_aarch64=('a30d0ef050911bdca9d4c0d6afa224bc339daae3ad7a6782a66a33678506160b')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgexec}" "${pkgdir}/usr/bin/${_pkgexec}"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
