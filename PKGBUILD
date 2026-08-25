# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=jpillora
_pkgname=temo
pkgname=${_pkgname}-bin
pkgver=0.2.0
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

sha256sums_x86_64=('c75cb6c34b5e5e6fcb21b1ed0fe10b4d2da7fcfe6faa450ad2a108308ebd2d6c')
sha256sums_i686=('07998fd140042ad97546c75d47e618d4846907d662e13b2961f46e56694b5fc5')
sha256sums_aarch64=('51b1fdb2ca6b1f810b85854b7be3529d7281e453ccfdcebcf1e0e2629ad45b98')


package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
