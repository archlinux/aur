# Maintainer: Javier Tia <javier dot tia at gmail dot com>

_name=xmlcutty
pkgname="${_name}-bin"
pkgver=0.1.5
pkgrel=1
pkgdesc="xmlcutty is a simple tool for carving out elements from large XML files, fast - binary static"
arch=('x86_64')
url="https://github.com/miku/xmlcutty"
license=('GPL3')
options=('!strip' '!emptydirs')
conflicts=("${_name}")
replaces=("${_name}")
source=("${url}/releases/download/v${pkgver}/${_name}_${pkgver}_amd64.deb")
sha256sums=('da247e1ed755a6bda9c1d680dc856adfe8b2ff8df93c6ac660dd9f8d3c6c078d')

package() {
  ar x ${_name}_${pkgver}_amd64.deb
  tar xf data.tar.xz --no-same-permissions --no-overwrite-dir -C ${pkgdir}
  mv ${pkgdir}/usr/sbin ${pkgdir}/usr/bin
}

# vim:set ts=2 sw=2 et:
