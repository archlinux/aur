# Contributor: Médéric Boquien <mboquien@free.fr>
# Maintainer: Médéric Boquien <mboquien@free.fr>
_pkg=PyAVM
pkgname=python-pyavm
pkgver=0.9.6
pkgrel=1
pkgdesc="Module to represent, read, and write Astronomy Visualization Metadata"
arch=('any')
url="http://astrofrog.github.io/pyavm/"
license=("MIT")
depends=('python>=3.8' 'python-numpy>=1.10' 'python-astropy')
makedepends=(python-build python-installer python-wheel)
source=("https://pypi.python.org/packages/source/P/${_pkg}/${_pkg}-${pkgver}.tar.gz")
sha512sums=('4840a840fd817cd3b6c7142c2418a483f414064edc6697ff958c88f7acb72aa0dba4f9eac6786013ea97d976a9d506eda2cbbb496c7fe20befc6cc799026e4f6')

build() {
  cd "${srcdir}/${_pkg}-${pkgver}"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "${srcdir}/${_pkg}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -D LICENSE "${pkgdir}/usr/share/licenses/python-${_pkg}/LICENSE"
}

