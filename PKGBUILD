# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=sheepla
_pkgname=whois-cli
pkgname=${_pkgname}-bin
pkgver=0.0.5
pkgrel=1
pkgdesc='simple command line whois client'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'i686' 'aarch64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_Linux_x86_64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_Linux_i386.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_Linux_arm64.tar.gz")
sha256sums_x86_64=('d4b5dc9b4b13f7c45d6729de37d082a897372bcbc6f1e8a91d1b6e6d0f7965a9')
sha256sums_i686=('a12e814abd12afa6ff478e714ecadce9dafbfd04fd022dd8418fa929d7d41aa0')
sha256sums_aarch64=('599670cce5fec30fa096861b828fe80559f372ade6cf27a8506f832474980999')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname//-cli/}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
