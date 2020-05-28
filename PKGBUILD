# Maintainer: Ross Whitfield <whitfieldre@ornl.gov>
pkgname='python-nexpy'
_pkgname=nexpy
pkgver=0.12.5
pkgrel=1
pkgdesc="NeXpy: A Python GUI to analyze NeXus data"
url="http://nexpy.github.io/nexpy"
arch=("any")
license=('BSD')
makedepends=('python-setuptools' 'python-six')
depends=('python-numpy' 'python-h5py' 'python-scipy' 'python-nexusformat' 'jupyter' 'python-matplotlib' 'python-ansi2html')
source=("https://github.com/nexpy/nexpy/archive/v${pkgver}.tar.gz")
md5sums=('dcad442c7ad3cca3cea08674752642be')

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    sed -i 's/jupyter/jupyter_core/' src/nexpy/requires.py # Can't find jupyter at run time
    python setup.py install --root="$pkgdir/" --optimize=1
}
