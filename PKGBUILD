# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=python-pymediainfo
pkgver=2.1.5
pkgrel=1
pkgdesc='A Python wrapper around the MediaInfo command line utility'
arch=('any')
url='https://github.com/paltman/pymediainfo'
license=('MIT')
depends=('mediainfo' 'python-setuptools')
makedepends=('git')
_commit='8c26bf0b93f684f6ec4649dc7f64c6b90f30fc22'
source=("pymediainfo-${pkgver}.tar.gz::https://github.com/sbraz/pymediainfo/archive/v${pkgver}.tar.gz")
sha256sums=('f0840947f559ef0c47b2722d957bbec2864d1b2b85c5484ea31e6c6cf45c011b')

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
