# Maintainer:  Liam Timms <timms5000@gmail.com>
# contributor:  Michel Zou

pkgname=python-nbsphinx
pkgver=0.8.6
pkgrel=1
pkgdesc="Jupyter Notebook Tools for Sphinx"
url="http://nbsphinx.rtfd.org/"
arch=(any)
license=('MIT')
depends=('python-docutils' 'python-jinja' 'jupyter-nbconvert' 'jupyter-nbformat' 'python-sphinx')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/spatialaudio/nbsphinx/archive/${pkgver}.tar.gz")
sha256sums=('f8191e3c05ce797e166ee0717fa65fc4fc95fb832c5a32a9f51e3dd91f9c7801')

build() {
  cd "${srcdir}"/nbsphinx-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}/nbsphinx-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}
