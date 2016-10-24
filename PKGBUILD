# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

_name=sift
pkgname=${_name}-bin
pkgver=0.9.0
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
sha256sums_i686=('d1a0362b280b6d80ad348d66a02a4a0758bb8448b3296f9fdb74b048928f5f9d')
sha256sums_x86_64=('980a048d2414e042190d45d84e620295629e267deb16cdf3df2b48f0cb0c4db3')

[[ "$CARCH" = "i686" ]] && _arch='386'
[[ "$CARCH" = "x86_64" ]] && _arch='amd64'

package() {
  cd "${_name}_${pkgver}_linux_${_arch}"

  install -Dm 775 "${_name}" "${pkgdir}/usr/bin/${_name}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
}

# vim:set ft=sh ts=2 sw=2 et:
