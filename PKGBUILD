# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=python-pymediainfo
pkgver=2.0
pkgrel=1
pkgdesc='A Python wrapper around the MediaInfo command line utility'
arch=('any')
url='https://github.com/paltman/pymediainfo'
license=('MIT')
depends=('mediainfo' 'python-setuptools')
makedepends=('git')
_commit='8c26bf0b93f684f6ec4649dc7f64c6b90f30fc22'
source=("pymediainfo-${pkgver}.tar.gz::https://github.com/sbraz/pymediainfo/archive/v${pkgver}.tar.gz")
sha256sums=('7605850f67f88724aac3d995028dbfec30d760e6ea3c7dd554447f37a1b7de8c')

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
