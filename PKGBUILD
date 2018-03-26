# Maintainer: Miguel de Val-Borro <miguel.deval at gmail dot com>
# Contributor: Universebenzene <universebenzene at sina dot com>
pkgname=('python-astropy-helpers')
pkgver=3.0.1
pkgrel=1
pkgdesc="Utilities used for building the Astropy python library for astronomy"
arch=('any')
url="https://github.com/astropy/astropy-helpers"
license=('BSD')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/a/astropy-helpers/astropy-helpers-${pkgver}.tar.gz")
md5sums=('0a67da939a2af2eab492695d800190f2')

build() {
  cd ${srcdir}/astropy-helpers-${pkgver}
  patch -p1 -i ../../astropy_helpers.patch
  python setup.py build --use-system-libraries
}

package() {
  cd ${srcdir}/astropy-helpers-${pkgver}
  install -D -m644 LICENSE.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.rst"
  python setup.py install --prefix=/usr --root=${pkgdir}
}
