# Maintainer: Javier Tia <javier dot tia at gmail dot com>
_name=sift
pkgname=${_name}-bin
pkgver=0.5.0
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
sha256sums_i686=('c65bdd39b23cde5fbed6ae0edfe0fda07ea73db3fccc8648905dffbb6cbe387f')
sha256sums_x86_64=('13bc84f8ce934d226b4477657298fd1b99407e0408030e1e583becc456222ed1')

[[ "$CARCH" = "i686" ]] && _arch='386'
[[ "$CARCH" = "x86_64" ]] && _arch='amd64'

package() {
  cd "${_name}_${pkgver}_linux_${_arch}"

  install -Dm 775 "${_name}" "${pkgdir}/usr/bin/${_name}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
}

# vim:set ft=sh ts=2 sw=2 et:
