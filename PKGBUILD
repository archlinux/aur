# Contributor: Médéric Boquien <mboquien@free.fr>
# Maintainer: Médéric Boquien <mboquien@free.fr>
pkgname=python-astropy
pkgver=1.0.3
pkgrel=1
pkgdesc="A community python library for astronomy"
arch=('i686' 'x86_64')
url="http://www.astropy.org/"
license=('BSD')
depends=('python>=3.3' 'python-numpy>=1.6' 'python-scipy' 'python-h5py' 'cfitsio' 'expat' 'wcslib' 'erfa')
conflicts=('python-pyfits' 'python-vo')
makedepends=('cython')
source=("http://pypi.python.org/packages/source/a/astropy/astropy-${pkgver}.tar.gz")
md5sums=('d88ddc945b8146ae47f871b77ddbc0ff')

build() {
  cd ${srcdir}/astropy-${pkgver}

  python setup.py build --use-system-libraries --offline 
}

package() {
  cd ${srcdir}/astropy-${pkgver}

  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" licenses/*
  python setup.py install --offline --root=${pkgdir} --prefix=/usr --optimize=1
}

