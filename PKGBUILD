# Maintainer:  Liam Timms <timms5000@gmail.com>
# contributor:  Michel Zou

pkgname=python-nbsphinx
pkgver=0.8.7
pkgrel=1
pkgdesc="Jupyter Notebook Tools for Sphinx"
url="http://nbsphinx.rtfd.org/"
arch=(any)
license=('MIT')
depends=('python-docutils' 'python-jinja' 'jupyter-nbconvert' 'jupyter-nbformat' 'python-sphinx')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/spatialaudio/nbsphinx/archive/${pkgver}.tar.gz")
sha256sums=('6f32e28ce23aa30a71ebebd78fb3bfb7a43253f8f8a679310780b2a469e2bbce')

build() {
  cd "${srcdir}"/nbsphinx-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}/nbsphinx-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}
