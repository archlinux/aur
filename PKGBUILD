# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=python-jellyfish
pkgver=0.5.6
pkgrel=1
pkgdesc='A python library for doing approximate and phonetic matching of strings'
arch=('i686' 'x86_64')
url='https://github.com/sunlightlabs/jellyfish'
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/94/48/ddb1458d966f0a84e472d059d87a9d1527df7768a725132fc1d810728386/jellyfish-${pkgver}.tar.gz")
sha256sums=('887a9a49d0caee913a883c3e7eb185f6260ebe2137562365be422d1316bd39c9')

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
