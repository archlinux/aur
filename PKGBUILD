# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=jpillora
_pkgname=temo
pkgname=${_pkgname}-bin
pkgver=0.1.0
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

sha256sums_x86_64=('938287aeead3b8f2a0332d2a7f4636065d2f0d4494b5e0b5598309f4e9e9f696')
sha256sums_i686=('c5eb4b11b003bc0ac26760fe5952d3be04d6e7cb94b579d911bb9a8cf033c007')
sha256sums_aarch64=('88c8e3ce290c89de659e128cb36c7553b7bcb3bc59d702dc78e8a565a8494a36')


package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
