# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
# Contributor: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Liam Timms <timms5000@gmail.com>
# Contributor: Michel Zou

pkgname=python-nbsphinx
pkgver=0.9.7
pkgrel=1
pkgdesc="Jupyter Notebook Tools for Sphinx"
url="http://nbsphinx.rtfd.org/"
arch=(any)
license=('MIT')
depends=('python-docutils' 'python-jinja' 'jupyter-nbconvert' 'jupyter-nbformat' 'python-sphinx')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/spatialaudio/nbsphinx/archive/${pkgver}.tar.gz")
b2sums=('51e7fffd319faa2d7aceb5e30cdb45433507facc9e57aa249f0fa6bfb67426de5f71bbcd7cedc0509048729e74143f84dfa923c7d2515df9185ff6577f4d2ea2')

build() {
  cd "${srcdir}"/nbsphinx-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/nbsphinx-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
