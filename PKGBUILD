# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python-astroscrappy
pkgver=1.0.5
pkgrel=1
pkgdesc="Speedy Cosmic Ray Annihilation Package in Python"
arch=('i686' 'x86_64')
url="https://github.com/astropy/astroscrappy"
license=('BSD')
depends=('python' 'python-numpy' 'python-astropy' 'cython>=0.21')
source=("https://files.pythonhosted.org/packages/source/a/astroscrappy/astroscrappy-${pkgver}.tar.gz")
md5sums=('e7ec5d829191226e6092b08e1d8f4cd4')

package() {
  cd ${srcdir}/astroscrappy-${pkgver}

  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" licenses/*
  python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}
