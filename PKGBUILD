# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=python-pymediainfo
pkgver=2.2.0
pkgrel=1
pkgdesc='A Python wrapper around the MediaInfo command line utility'
arch=('any')
url='https://github.com/paltman/pymediainfo'
license=('MIT')
depends=('mediainfo' 'python-setuptools')
makedepends=('git')
_commit='8c26bf0b93f684f6ec4649dc7f64c6b90f30fc22'
source=("pymediainfo-${pkgver}.tar.gz::https://github.com/sbraz/pymediainfo/archive/v${pkgver}.tar.gz")
sha256sums=('2596cc1ebde1c992302d38636219c1776d6bd4a4c90fb9fa8a577520d34beeaa')

build() {
  cd pymediainfo-${pkgver}

  python setup.py build
}

package(){
  cd pymediainfo-${pkgver}

  python setup.py install --root="${pkgdir}" --optimize='1'

  install -dm 755 "${pkgdir}"/usr/share/licenses/python-pymediainfo
  install -m 644 LICENSE "${pkgdir}"/usr/share/licenses/python-pymediainfo/
}

# vim: ts=2 sw=2 et:
