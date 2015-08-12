# Contributor: Camiloasc1 <camiloasc1@gmail.com>
# Maintainer: Camiloasc1 <camiloasc1@gmail.com>
pkgname=python2-astroquery
pkgver=0.2.6
pkgrel=1
pkgdesc="Set of tools for querying astronomical web forms and databases"
arch=('i686' 'x86_64')
url="http://astroquery.readthedocs.org/en/latest/"
license=('BSD')
depends=('python2>=2.6' 'python2-numpy>=1.6' 'python2-astropy>=0.4' 'python2-requests' 'python2-keyring' 'python2-beautifulsoup4')
conflicts=()
makedepends=('cython2')
source=("http://pypi.python.org/packages/source/a/astroquery/astroquery-${pkgver}.tar.gz")
md5sums=('96e857cc8a33e390409006ceb49c1fef')

build() {
  cd ${srcdir}/astroquery-${pkgver}
  python2 setup.py build --use-system-libraries --offline
}

package() {
  cd ${srcdir}/astroquery-${pkgver}

  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" licenses/*
  python2 setup.py install --offline --root=${pkgdir} --prefix=/usr --optimize=1
}

