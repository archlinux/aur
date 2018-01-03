pkgname=python-nbsphinx
pkgver=0.3.0
pkgrel=1
pkgdesc="Jupyter Notebook Tools for Sphinx"
url="http://nbsphinx.rtfd.org/"
arch=(any)
license=('MIT')
depends=('python-docutils' 'python-jinja' 'jupyter-nbconvert' 'jupyter-nbformat' 'python-sphinx')
makedepends=('python-setuptools')
source=("https://github.com/spatialaudio/nbsphinx/archive/${pkgver}.tar.gz")
sha256sums=('e9bff573092ab95a19b4038c55a26f3a56da335e14af604934968e4c423c4d2f')

build() {
  cd "${srcdir}"/nbsphinx-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}/nbsphinx-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
}
