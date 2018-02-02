# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python2-spherical_geometry
pkgver=1.1.0
pkgrel=2
pkgdesc="Python based tools for spherical geometry"
arch=('i686' 'x86_64')
url="http://www.stsci.edu/resources/software_hardware/stsci_python"
license=('BSD')
depends=('python2>=2.7' 'python2-numpy>=1.5' 'qd>=2.3.7' 'python2-astropy>=0.3')
makedepends=('cython')
source=("https://files.pythonhosted.org/packages/source/s/spherical_geometry/spherical_geometry-${pkgver}.tar.gz")
md5sums=('83511d7d9ec2862f138e9e551432a544')

package() {
  cd ${srcdir}/spherical_geometry-${pkgver}

  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" licenses/*
  python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}
