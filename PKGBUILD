pkgname=python-orange
pkgver=3.2
pkgrel=1
pkgdesc="Open source data visualization and analysis for novice and experts. Data mining through visual programming or Python scripting."
arch=('i686' 'x86_64')
url="http://orange.biolab.si/"
license=('GPL3')
makedepends=('python-setuptools')
depends=('python-beautifulsoup4' 'python-chardet' 'python-docutils' 'python-jinja' 'python-xlrd' 'python-matplotlib' 'python-scikit-learn' 'python-pyqt4' 'python-recommonmark' 'python-sqlparse' 'python-psycopg2' 'python-bottlechest')
optdepends=('python-pyqt4: GUI support')
source=("https://github.com/biolab/orange3/archive/${pkgver}.tar.gz")
sha1sums=('d886f86dc0c982859b9bb5eda47011c06b314f80')

build() {
  cd "${srcdir}/orange3-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/orange3-$pkgver"
  python setup.py install --root="${pkgdir}"
}

