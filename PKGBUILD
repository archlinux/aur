# Maintainer: Javier Tia <javier dot tia at gmail dot com>
pkgname=sift-bin
_rname=sift
pkgver=0.4.0
pkgrel=1
pkgdesc="A fast and powerful open source alternative to grep - Static binary"
arch=('i686' 'x86_64')
url="http://sift-tool.org/"
license=('GPL3')
options=('!strip' '!emptydirs')
conflicts=('sift')
replaces=('sift')
source_i686=("http://sift-tool.org/downloads/${_rname}/${_rname}_${pkgver}_linux_386.tar.gz")
source_x86_64=("http://sift-tool.org/downloads/${_rname}/${_rname}_${pkgver}_linux_amd64.tar.gz")
sha256sums_i686=('bc7c622066da41df47caf360169d1a8983db4533debb1f2dec3183cc1c21f957')
sha256sums_x86_64=('44eb25b16df941a74e66cb016c6e6ddece62ceb4be248c570bda669eca87aae5')

[[ "$CARCH" = "i686" ]] && _arch='386'
[[ "$CARCH" = "x86_64" ]] && _arch='amd64'

package() {
  cd "${_rname}_${pkgver}_linux_${_arch}"

  install -Dm 775 "${_rname}" "${pkgdir}/usr/bin/${_rname}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${_rname}/LICENSE"
}

# vim:set ft=sh ts=2 sw=2 et:
