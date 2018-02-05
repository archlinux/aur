# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python-regions
pkgver=0.2
pkgrel=1
pkgdesc="Astropy affilated package for region handling"
arch=('i686' 'x86_64')
url="http://astropy-regions.readthedocs.io/en/latest/"
license=('BSD')
depends=('python>=3.4' 'python-numpy>=1.9' 'python-astropy>=1.2')
makedepends=('cython')
optdepends=('python-matplotlib>=1.5: Plotting support'
            'python-shapely: Managing geometric objects'
            'python-pytest-arraydiff: For testing')
source=("https://files.pythonhosted.org/packages/source/r/regions/regions-${pkgver}.tar.gz")
md5sums=('48597dc17906e478292040dae2df5596')

package() {
  cd ${srcdir}/regions-${pkgver}

  install -D -m644 docs/{*.rst,*.py,*.txt} -t "${pkgdir}/usr/share/doc/${pkgname}"
  python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}
