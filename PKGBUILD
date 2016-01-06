# Maintainer: Javier Tia <javier dot tia at gmail dot com>
_name=sift
pkgname=${_name}-bin
pkgver=0.7.1
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
sha256sums_i686=('09c8c3e0e894f9d85172fe084750cbcdd65910c87c5e2cec04d000f73aae56c8')
sha256sums_x86_64=('119fdb96191f56203852aaecbeeb3bbd4a419bf7f2589b455f567dd48fec22dd')

[[ "$CARCH" = "i686" ]] && _arch='386'
[[ "$CARCH" = "x86_64" ]] && _arch='amd64'

package() {
  cd "${_name}_${pkgver}_linux_${_arch}"

  install -Dm 775 "${_name}" "${pkgdir}/usr/bin/${_name}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
}

# vim:set ft=sh ts=2 sw=2 et:
