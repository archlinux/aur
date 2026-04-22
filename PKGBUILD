# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
# Contributor: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Liam Timms <timms5000@gmail.com>
# Contributor: Michel Zou

pkgname=python-nbsphinx
pkgver=0.9.8
pkgrel=1
pkgdesc="Jupyter Notebook Tools for Sphinx"
url="http://nbsphinx.rtfd.org/"
arch=(any)
license=('MIT')
depends=('python-docutils' 'python-jinja' 'jupyter-nbconvert' 'jupyter-nbformat' 'python-sphinx')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/spatialaudio/nbsphinx/archive/${pkgver}.tar.gz")
b2sums=('e6d66211c265bc219fdf500e8b74d897f683ab9a12560f90d93dda2640a0db94d9c99738d1abf88dbd3996aef6e35cb28a87d04ed4c72f12357846e08e50b1b4')

build() {
  cd "${srcdir}"/nbsphinx-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/nbsphinx-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
