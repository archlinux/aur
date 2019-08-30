# Maintainer: Javier Tia <javier dot tia at gmail dot com>

_name=xmlcutty
pkgname="${_name}-bin"
pkgver=0.1.6
pkgrel=1
pkgdesc="xmlcutty is a simple tool for carving out elements from large XML files, fast - binary static"
arch=('x86_64')
url="https://github.com/miku/xmlcutty"
license=('GPL3')
options=('!strip' '!emptydirs')
conflicts=("${_name}")
replaces=("${_name}")
source=("${url}/releases/download/v${pkgver}/${_name}_${pkgver}_amd64.deb")
sha256sums=('dd1b7eed320a02b6f8fd68064a8317e4c0ef186b4d1053738f510de9822f4b5c')

package() {
  ar x ${_name}_${pkgver}_amd64.deb
  tar xf data.tar.xz --no-same-permissions --no-overwrite-dir -C ${pkgdir}
  mv ${pkgdir}/usr/sbin ${pkgdir}/usr/bin
}

# vim:set ts=2 sw=2 et:
