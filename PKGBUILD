# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python-reproject
pkgver=0.4
pkgrel=1
pkgdesc="Python-based Astronomical image reprojection"
arch=('i686' 'x86_64')
url="http://reproject.readthedocs.io/en/stable/"
license=('BSD')
depends=('python' 'python-numpy>=1.10' 'python-scipy>=0.9' 'python-astropy>=2.0' 'python-astropy-healpix>=0.2')
makedepends=('cython')
source=("https://files.pythonhosted.org/packages/source/r/reproject/reproject-${pkgver}.tar.gz")
md5sums=('56777bf5c2f8e2a7c0a05b3d058943c2')

package() {
  cd ${srcdir}/reproject-${pkgver}

  install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}
