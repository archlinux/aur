# Maintainer: Felix Schindler <felix at schindlerfamily dot de>
# Contributor: Hector Mtz-Seara <hseara__*a*t*__gmail*.*com>

pkgname=python2-scientificpython
pkgver=2.9.4
pkgrel=1
pkgdesc="ScientificPython is a collection of Python modules for scientific computing. It contains support for geometry, mathematical functions, statistics, physical units, IO, visualization, and parallelization."
arch=('i686' 'x86_64')
url="http://dirac.cnrs-orleans.fr/plone/software/scientificpython/"
license=('custom:CeCILL')
depends=('python2-numpy' 'netcdf')
source=(https://sourcesup.renater.fr/frs/download.php/file/3420/ScientificPython-$pkgver.tar.gz)
md5sums=('dc2987089e106cb807b4ccecf7adc071')

build() {
  cd "$srcdir"/ScientificPython-$pkgver
  python2 setup.py build
}

package() {
  cd "$srcdir"/ScientificPython-$pkgver
  python2 setup.py install --prefix=/usr --root=${pkgdir}
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
}

