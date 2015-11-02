# Maintainer: Javier Tia <javier dot tia at gmail dot com>
pkgname=sift-bin
_rname=sift
pkgver=0.4.1
pkgrel=1
pkgdesc="A fast and powerful open source alternative to grep - Static binary"
arch=('i686' 'x86_64')
url="http://sift-tool.org/"
license=('GPL3')
options=('!strip' '!emptydirs')
conflicts=('sift')
replaces=('sift')
provides=("sift=${pkgver}")
source_i686=("${url}/downloads/${_rname}/${_rname}_${pkgver}_linux_386.tar.gz")
source_x86_64=("${url}/downloads/${_rname}/${_rname}_${pkgver}_linux_amd64.tar.gz")
sha256sums_i686=('56ec0039d7976fd077fec614e8bccc1d5fcf6b4619fec68ab0958a88af193753')
sha256sums_x86_64=('4dff93da3049fb18e67f52fd823f4c06c8b650baa6573c21a1c5758e00f3c571')

[[ "$CARCH" = "i686" ]] && _arch='386'
[[ "$CARCH" = "x86_64" ]] && _arch='amd64'

package() {
  cd "${_rname}_${pkgver}_linux_${_arch}"

  install -Dm 775 "${_rname}" "${pkgdir}/usr/bin/${_rname}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${_rname}/LICENSE"
}

# vim:set ft=sh ts=2 sw=2 et:
