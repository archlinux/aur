# Maintainer: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
# Contributor: dnuux <dnuuxx@gmail.com>

pkgbase=python-fake-factory
pkgname=(python-fake-factory python2-fake-factory)
pkgver=0.5.3
pkgrel=1
pkgdesc='Faker generates fake data for you.'
arch=('any')
url='http://www.joke2k.net/faker/'
license=(MIT)
makedepends=(python-setuptools python2-setuptools)
options=(!emptydirs)
source=("https://github.com/joke2k/faker/archive/v${pkgver}.tar.gz")
sha256sums=('ab4961b1ed34b1c011a17c633332f108f45d8b80042e764a1965f7e2c3961894')

package_python-fake-factory() {
  depends=(python)
  cd "${srcdir}/faker-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

package_python2-fake-factory() {
  depends=(python2)
  cd "${srcdir}/faker-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  mv "${pkgdir}/usr/bin/faker" "${pkgdir}/usr/bin/faker-python2"
  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:
