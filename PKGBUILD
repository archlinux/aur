# Maintainer: Miguel de Val-Borro <miguel.deval at gmail dot com>
pkgname=('python-astropy-helpers')
pkgver=2.0.3
pkgrel=2
pkgdesc="Utilities used for building the Astropy python library for astronomy"
arch=('any')
url="https://github.com/astropy/astropy-helpers"
license=('BSD')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/a/astropy-helpers/astropy-helpers-${pkgver}.tar.gz")
md5sums=('8129ddec049865e7401d1a7e86b3a22b')

build() {
  cd ${srcdir}/astropy-helpers-${pkgver}
  python setup.py build --use-system-libraries
}

package() {
  cd ${srcdir}/astropy-helpers-${pkgver}
  install -D -m644 LICENSE.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.rst"
  python setup.py install --prefix=/usr --root=${pkgdir}
}
