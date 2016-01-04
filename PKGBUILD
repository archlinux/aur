# Maintainer: Javier Tia <javier dot tia at gmail dot com>
_name=sift
pkgname=${_name}-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="A fast and powerful open source alternative to grep - Static binary"
arch=('i686' 'x86_64')
url="http://sift-tool.org/"
license=('GPL3')
options=('!strip' '!emptydirs')
conflicts=('sift')
replaces=('sift')
provides=("sift=${pkgver}")
source_i686=("${url}/downloads/${_name}/${_name}_${pkgver}_linux_386.tar.gz")
source_x86_64=("${url}/downloads/${_name}/${_name}_${pkgver}_linux_amd64.tar.gz")
sha256sums_i686=('edbde5bc1e1bbc92cd283da6ec1e2e3ae9f364fa5e46f51a299efd6f701592e7')
sha256sums_x86_64=('ca4b6281a9c49607008d57b4274b79dccfbd023e98ca5ac15701e9f71fa6ec59')

[[ "$CARCH" = "i686" ]] && _arch='386'
[[ "$CARCH" = "x86_64" ]] && _arch='amd64'

package() {
  cd "${_name}_${pkgver}_linux_${_arch}"

  install -Dm 775 "${_name}" "${pkgdir}/usr/bin/${_name}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
}

# vim:set ft=sh ts=2 sw=2 et:
