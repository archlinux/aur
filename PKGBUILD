pkgname=python-nbsphinx
pkgver=0.5.0
pkgrel=1
pkgdesc="Jupyter Notebook Tools for Sphinx"
url="http://nbsphinx.rtfd.org/"
arch=(any)
license=('MIT')
depends=('python-docutils' 'python-jinja' 'jupyter-nbconvert' 'jupyter-nbformat' 'python-sphinx')
makedepends=('python-setuptools')
source=("https://github.com/spatialaudio/nbsphinx/archive/${pkgver}.tar.gz")
sha256sums=('381cedbda9b830a1e5aceeadca84c0b9cf810eddd82068fb5397092da0ae8755')

build() {
  cd "${srcdir}"/nbsphinx-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}/nbsphinx-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
}
