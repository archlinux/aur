pkgname=python-nbsphinx
pkgver=0.3.3
pkgrel=1
pkgdesc="Jupyter Notebook Tools for Sphinx"
url="http://nbsphinx.rtfd.org/"
arch=(any)
license=('MIT')
depends=('python-docutils' 'python-jinja' 'jupyter-nbconvert' 'jupyter-nbformat' 'python-sphinx')
makedepends=('python-setuptools')
source=("https://github.com/spatialaudio/nbsphinx/archive/${pkgver}.tar.gz")
sha256sums=('a7df60a716767688242342d76935c137f2ce552f56fe2bf0d3426cff9ad41efd')

build() {
  cd "${srcdir}"/nbsphinx-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}/nbsphinx-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
}
