# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=jupyter-singular
pkgver=0.9.9
pkgrel=1
pkgdesc="Jupyter kernel for Singular"
arch=(any)
url="https://github.com/sebasguts/jupyter_kernel_singular"
license=(GPL)
depends=(ipython
         jupyter-notebook
         python
         python-ipykernel
         python-ipywidgets
         python-pexpect
         python-pysingular)
makedepends=(python-build
             python-installer
             python-setuptools
             python-wheel)
source=(https://pypi.io/packages/source/j/jupyter_kernel_singular/jupyter_kernel_singular-$pkgver.tar.gz)
md5sums=('40464609dec908950af7058ded8d93e2')

build() {
  cd jupyter_kernel_singular-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd jupyter_kernel_singular-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  mv "$pkgdir"{/usr,}/etc
}
