# Maintainer: Javier Tia <javier dot tia at gmail dot com>

_name=distribution
pkgname="python-${_name}"
pkgver=1.2.2
pkgrel=1
pkgdesc='Short, simple, direct scripts for creating ASCII graphical histograms in the terminal'
url='https://github.com/philovivero/distribution'
arch=('any')
license=('GPL2')
depends=('python2')
provides=("${_name}=${pkgver}")
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('b6bfca0b2a802c179f0a9b3dc12290ac0331f10f7472230e1e664aeff16ebd63')

prepare() {
  cd "${srcdir}/${_name}-${pkgver}"
  sed -i 's|^#!/usr/bin/python$|#!/usr/bin/python2|' ${_name}.py
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  install -Dm 775 "${_name}.py" "${pkgdir}/usr/bin/${_name}"
  install -Dm 644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=sh ts=2 sw=2 et:
