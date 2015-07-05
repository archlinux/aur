# Maintainer: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
# Contributor: dnuux <dnuuxx@gmail.com>

pkgbase=python-fake-factory
_pkgbase="${pkgbase#python-}"
pkgname=(python-fake-factory python2-fake-factory)
pkgver=0.5.2
pkgrel=1
pkgdesc='Generates fake data for you.'
arch=('any')
url='http://www.joke2k.net/faker/'
license=(MIT)
makedepends=(python-setuptools python2-setuptools)
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/f/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz")
sha256sums=('37b121776d0ee180440fb3133baff8c97dbaaafdb3fc9a659ac6db498abcbc27')

package_python-fake-factory() {
  depends=(python)
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

package_python2-fake-factory() {
  depends=(python2)
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  mv "${pkgdir}/usr/bin/faker" "${pkgdir}/usr/bin/faker-python2"
  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:
