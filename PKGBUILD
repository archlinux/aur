# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python-astropy-healpix
pkgver=0.2
pkgrel=1
pkgdesc="BSD-licensed HEALPix for Astropy"
arch=('i686' 'x86_64')
url="http://astropy-healpix.readthedocs.io/en/latest/"
license=('BSD')
depends=('python' 'python-numpy>=1.10' 'python-astropy>=1.2')
makedepends=('cython')
optdepends=('python-pytest: For testing'
            'python-healpy: For testing (will be skipped if healpy is not installed while testing)'
            'python-hypothesis: For the healpy-related tests')
source=("https://files.pythonhosted.org/packages/source/a/astropy-healpix/astropy-healpix-${pkgver}.tar.gz")
md5sums=('88cbb91e9c4dc61740735c9a9bdaaec5')

package() {
  cd ${srcdir}/astropy-healpix-${pkgver}

  install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}
