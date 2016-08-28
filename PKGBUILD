# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=python-jellyfish
pkgver=0.5.2
pkgrel=1
pkgdesc='A python library for doing approximate and phonetic matching of strings'
arch=('i686' 'x86_64')
url='https://github.com/sunlightlabs/jellyfish'
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/j/jellyfish/jellyfish-${pkgver}.tar.gz")
sha256sums=('96a96630a1dec21e634b967b040d42d1cb316b9a54885b434e2fbe90d704b397')

build() {
  cd jellyfish-${pkgver}

  python setup.py build
}

package() {
  cd jellyfish-${pkgver}

  python setup.py install --root="${pkgdir}" --optimize='1'

  install -dm 755 "${pkgdir}"/usr/share/licenses/python-jellyfish
  install -m 644 LICENSE "${pkgdir}"/usr/share/licenses/python-jellyfish/
}

# vim: ts=2 sw=2 et:
