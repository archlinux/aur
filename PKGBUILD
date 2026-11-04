# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=jpillora
_pkgname=temo
pkgname=${_pkgname}-bin
pkgver=0.5.1
pkgrel=1
pkgdesc='A terminal demoscene in pure Go, built entirely on Charm libraries'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'i686' 'aarch64')
_barch=('amd64' '386' 'arm64')
license=('Unlincense')

conflicts=("${_pkgname}")
provides=("${_pkgname}")

options=('!strip')

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_${_barch[0]}.tar.gz")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_${_barch[1]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_${_barch[2]}.tar.gz")

sha256sums_x86_64=('b5c3a974b9763016284e11b9f81a5caba86c75692ddda0e0033bbe1e20c0bcc8')
sha256sums_i686=('6504cca79ff2d6f1cff8719f0c9881dd38a707acc15a4366ccfd48c6bfc1afcd')
sha256sums_aarch64=('f931f5937e1d5140472627ee01edaae0840dde3a4ef1b165878df3083e204570')


package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
