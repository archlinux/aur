# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python-ccdproc
pkgver=1.3.0.post1
pkgrel=1
pkgdesc="Affiliated package for the AstroPy package for basic data reductions of CCD images"
arch=('i686' 'x86_64')
url="http://ccdproc.readthedocs.io/en/latest/"
license=('BSD')
depends=('python' 'python-numpy' 'python-scipy' 'python-astropy>=1.0' 'python-scikit-image' 'python-astroscrappy' 'python-reproject')
makedepends=('cython')
source=("https://files.pythonhosted.org/packages/source/c/ccdproc/ccdproc-${pkgver}.tar.gz")
md5sums=('89a5795245a517fbb5ca740aa85625b6')

package() {
  cd ${srcdir}/ccdproc-${pkgver}

  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" licenses/*
  python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}
