# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=hedhyw
_pkgname=json-log-viewer
_pkgexec=jlv
pkgname=${_pkgname}-bin
pkgver=1.5.0
pkgrel=1
pkgdesc='Interactive viewer for JSON logs.'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'i686' 'aarch64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgexec}")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgexec}_linux_amd64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgexec}_linux_386.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgexec}_linux_arm64.tar.gz")
sha256sums_x86_64=('3df27ac9972cb3f45d4ec30ab47102bfbd7a8a28ee677587e33644f7d052541b')
sha256sums_i686=('4ae0223dd1622379ec0392c8cfcdf6606a1347f7a9bdc7b4e703a692897f46e4')
sha256sums_aarch64=('cc927e73fdb25adc8ddb61ed076f4537ae8d6006afd184b64ecd2e75be6da46d')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgexec}" "${pkgdir}/usr/bin/${_pkgexec}"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
