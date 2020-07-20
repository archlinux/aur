pkgname=python-nbsphinx
pkgver=0.7.1
pkgrel=1
pkgdesc="Jupyter Notebook Tools for Sphinx"
url="http://nbsphinx.rtfd.org/"
arch=(any)
license=('MIT')
depends=('python-docutils' 'python-jinja' 'jupyter-nbconvert' 'jupyter-nbformat' 'python-sphinx')
makedepends=('python-setuptools')
source=("https://github.com/spatialaudio/nbsphinx/archive/${pkgver}.tar.gz")
sha256sums=('67245c26d886e5db7c071bd8e6f877ec867696e8f42398b492fdc7086b38f11e')

build() {
  cd "${srcdir}"/nbsphinx-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}/nbsphinx-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}
