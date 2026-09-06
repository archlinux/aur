# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=jpillora
_pkgname=temo
pkgname=${_pkgname}-bin
pkgver=0.3.0
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

sha256sums_x86_64=('560c2d2013453d679d10a21bb0293484831d57de81af26d12fc77998dc95f565')
sha256sums_i686=('17231385b4ab6c36e3bb64b46b68b363da7038b14820789aa83a296b8b765aee')
sha256sums_aarch64=('95f3dabaa3477c01185c578f37f4fe5f21779024f3313f9c83e5634e47be1703')


package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
