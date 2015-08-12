# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=python-pymediainfo
pkgver=1.4.1
pkgrel=1
pkgdesc='A Python wrapper around the MediaInfo command line utility'
arch=('any')
url='https://github.com/paltman/pymediainfo'
license=('MIT')
depends=('mediainfo' 'python-beautifulsoup4' 'python-six')
makedepends=('git' 'python-setuptools')
_commit='8c26bf0b93f684f6ec4649dc7f64c6b90f30fc22'
source=("git+https://github.com/paltman/pymediainfo.git#commit=${_commit}")
sha256sums=('SKIP')

build() {
  cd pymediainfo

  python setup.py build
}

package(){
  cd pymediainfo

  python setup.py install --root="${pkgdir}" --optimize='1'

  install -dm 755 "${pkgdir}"/usr/share/licenses/python-pymediainfo
  install -m 644 LICENSE "${pkgdir}"/usr/share/licenses/python-pymediainfo/
}

# vim: ts=2 sw=2 et:
