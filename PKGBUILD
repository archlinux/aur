# Maintainer: Javier Tia <javier dot tia at gmail dot com>
pkgname=sift-bin
_rname=sift
pkgver=0.3.2
pkgrel=1
pkgdesc="A fast and powerful open source alternative to grep - Static binaries"
arch=('i686' 'x86_64')
url="http://sift-tool.org/"
license=('GPL3')
options=('!strip' '!emptydirs')
conflicts=('sift')
replaces=('sift')
source_i686=("http://sift-tool.org/downloads/${_rname}/${_rname}_${pkgver}_linux_386.tar.gz")
source_x86_64=("http://sift-tool.org/downloads/${_rname}/${_rname}_${pkgver}_linux_amd64.tar.gz")
md5sums_i686=('dd4072ab5ec382965185610cccf323d3')
md5sums_x86_64=('a618ba446ac00d5b3d17aef8207ba1a1')

[[ "$CARCH" = "i686" ]] && _arch='386'
[[ "$CARCH" = "x86_64" ]] && _arch='amd64'

package() {
  cd "${_rname}_${pkgver}_linux_${_arch}"

  install -Dm 775 "${_rname}" "${pkgdir}/usr/bin/${_rname}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${_rname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
