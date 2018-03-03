# Maintainer: Javier Tia <javier dot tia at gmail dot com>

_name=xmlcutty
pkgname="${_name}-bin"
pkgver=0.1.4
pkgrel=1
pkgdesc="xmlcutty is a simple tool for carving out elements from large XML files, fast - binary static"
arch=('x86_64')
url="https://github.com/miku/xmlcutty"
license=('')
options=('!strip' '!emptydirs')
conflicts=("${_name}")
replaces=("${_name}")
source=("${url}/releases/download/v${pkgver}/${_name}_${pkgver}_amd64.deb")
sha256sums=('5dfc56bf2b6458f0b141436794f3c5f0daff45d42ce25de044535197882939ce')

package() {
  ar x ${_name}_${pkgver}_amd64.deb
  tar xf data.tar.xz --no-same-permissions --no-overwrite-dir -C ${pkgdir}
  mv ${pkgdir}/usr/sbin ${pkgdir}/usr/bin
}

# vim:set ft=sh ts=2 sw=2 et:
