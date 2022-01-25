# Maintainer:  Liam Timms <timms5000@gmail.com>
# contributor:  Michel Zou

pkgname=python-nbsphinx
pkgver=0.8.8
pkgrel=1
pkgdesc="Jupyter Notebook Tools for Sphinx"
url="http://nbsphinx.rtfd.org/"
arch=(any)
license=('MIT')
depends=('python-docutils' 'python-jinja' 'jupyter-nbconvert' 'jupyter-nbformat' 'python-sphinx')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/spatialaudio/nbsphinx/archive/${pkgver}.tar.gz")
sha256sums=('a95f920c1378d78f4ed1e07dd7ce97abe10b7f4c29a22fc17d02a4d0beaac97d')

build() {
  cd "${srcdir}"/nbsphinx-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}/nbsphinx-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}
