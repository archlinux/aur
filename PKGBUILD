# Maintainer: Christian Pfeiffer <cpfeiffer@rev-crew.info>
# shellcheck disable=SC2034,SC2154,SC2164
# shellcheck shell=bash
pkgname='mogui'
pkgver=0.2.2
pkgrel=2
pkgdesc="Graphical user interface for Environment Modules"
arch=('any')
url="https://github.com/cea-hpc/mogui"
license=('GPL-2.0-or-later AND CC-BY-SA-3.0')
depends=('environment-modules' 'python' 'python-pyqt5')
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-setuptools' 'python-setuptools-scm')
_name='modules-gui'
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-$pkgver.tar.gz")
sha512sums=('b814392cf225bb635e25fe00b0f7ed3498a133e3b2d73b36b01c7d199718adfe7a0a2b51bffcbc7355702e0ae954e27f6e344833787f49ee08dca77ab7b0036b')
b2sums=('9e726899347c1f7649da54622cc8a98d0a1bcdbe453de02062953e8b8ce3e8413077bd4ff321389a3278cc5defe1dc45cdf30f21918ea0ba66bd06efef8fb648')

build() {
  cd "$srcdir/${_name}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${_name}-${pkgver}"

  python -m installer --destdir "$pkgdir" dist/*.whl
}
