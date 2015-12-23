# Maintainer: Javier Tia <javier dot tia at gmail dot com>
_name=sift
pkgname=${_name}-bin
pkgver=0.6.0
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
sha256sums_i686=('df47e268607accc92b0c9b3cdd40ffe91a8fe72112cf0999f35cb75689b50842')
sha256sums_x86_64=('cd35cdc4b325b2d628ce34f0a4af4006266bd20f595ec258b64d7788a9c0b2e9')

[[ "$CARCH" = "i686" ]] && _arch='386'
[[ "$CARCH" = "x86_64" ]] && _arch='amd64'

package() {
  cd "${_name}_${pkgver}_linux_${_arch}"

  install -Dm 775 "${_name}" "${pkgdir}/usr/bin/${_name}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
}

# vim:set ft=sh ts=2 sw=2 et:
