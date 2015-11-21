# Maintainer: Javier Tia <javier dot tia at gmail dot com>

_name=xmlcutty
pkgname="${_name}-bin"
pkgver=0.1.3
pkgrel=2
pkgdesc="xmlcutty is a simple tool for carving out elements from large XML files, fast - binary static"
arch=('x86_64')
url="https://github.com/miku/xmlcutty"
license=('')
options=('!strip' '!emptydirs')
conflicts=("${_name}")
replaces=("${_name}")
source=("${url}/releases/download/v${pkgver}/${_name}_${pkgver}_amd64.deb")
sha256sums=('0c9ff2b28b9fab5661d2e5c708490f9bfd7e982eb2760445fd9c137b67d2ef2f')

package() {
  ar x ${_name}_${pkgver}_amd64.deb
  tar xf data.tar.xz --no-same-permissions --no-overwrite-dir -C ${pkgdir}
  mv ${pkgdir}/usr/sbin ${pkgdir}/usr/bin
}

# vim:set ft=sh ts=2 sw=2 et:
