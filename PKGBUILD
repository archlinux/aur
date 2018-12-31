# Maintainer: Miguel de Val-Borro <miguel . deval @ gmail . com>

pkgname=python-astroquery
pkgver=0.3.9
pkgrel=1
pkgdesc="Set of tools for querying astronomical web forms and databases"
arch=('x86_64')
url="http://astroquery.readthedocs.org/en/latest/"
license=('BSD')
depends=('python>=3.4' 'python-numpy>=1.9' 'python-astropy>=1.0' 'python-requests' 'python-keyring' 'python-beautifulsoup4' 'python-html5lib')
conflicts=()
makedepends=('cython')
source=("https://files.pythonhosted.org/packages/source/a/astroquery/astroquery-${pkgver}.tar.gz")
md5sums=('f2d69fa431306894ed5db74432093e22')

build() {
  cd ${srcdir}/astroquery-${pkgver}
  python setup.py build --use-system-libraries --offline
}

package() {
  cd ${srcdir}/astroquery-${pkgver}

  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" licenses/*
  python setup.py install --offline --root=${pkgdir} --prefix=/usr --optimize=1
}
