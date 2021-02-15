# Contributor: Alexandr Parkhomenko <it@52tour.ru>

_author=biolab
_pkgname=orange-canvas-core
pkgname=python-$_pkgname-git
pkgver=0.1.19
pkgrel=1
pkgdesc="Orange Canvas core workflow editor."
arch=('i686' 'x86_64')
url="http://orange.biolab.si/"
license=('GPL3')
makedepends=('python-setuptools')
depends=('python-chardet' 'python-docutils' 'python-pyqtgraph' 'python-xlrd' 'python-matplotlib' 'python-scikit-learn' 'python-psycopg2' 'python-joblib' 'python-keyrings-alt' 'python-bottleneck' 'python-anyqt' 'qt5-svg' 'python-pip' 'python-serverfiles' 'python-louvain' 'python-xlsxwriter' 'python-opentsne' 'python-networkx' 'python-requests' 'python-pandas' 'python-opentsne')
source=("git://github.com/$_author/$_pkgname")
sha256sums=('SKIP')

pkgver () {
  cd "$srcdir/$_pkgname"
  git describe --tags `git rev-list --tags --max-count=1` | sed -r 's/^v//;s/-RC/RC/;s/([^-]*-g)/r\1/;s/-/./g' #| sed -r "s/0$/$COMMIT/"
}

build() {
  cd "${srcdir}/$_pkgname"
  python setup.py build
}

package() {
  cd "${srcdir}/$_pkgname"
  python setup.py install --root="${pkgdir}" --optimize=1
}

