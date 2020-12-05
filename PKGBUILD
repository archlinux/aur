pkgname=python-nbsphinx
pkgver=0.8.0
pkgrel=1
pkgdesc="Jupyter Notebook Tools for Sphinx"
url="http://nbsphinx.rtfd.org/"
arch=(any)
license=('MIT')
depends=('python-docutils' 'python-jinja' 'jupyter-nbconvert' 'jupyter-nbformat' 'python-sphinx')
makedepends=('python-setuptools')
source=("https://github.com/spatialaudio/nbsphinx/archive/${pkgver}.tar.gz")
sha256sums=('5a5269b456dfdc101d072a93e910481a41bceefb1926dc1c751927d7872308b2')

build() {
  cd "${srcdir}"/nbsphinx-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}/nbsphinx-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}
