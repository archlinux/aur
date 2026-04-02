# Maintainer: MihaiStreames <72852703+MihaiStreames@users.noreply.github.com>
pkgname=python-bdfparser
_pypiname=bdfparser
pkgver=2.2.0
pkgrel=1
pkgdesc="BDF bitmap font file parser in pure Python"
arch=(any)
url="https://github.com/tomchen/bdfparser"
license=(MIT)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=("https://files.pythonhosted.org/packages/source/${_pypiname::1}/${_pypiname}/${_pypiname}-$pkgver.tar.gz")
sha256sums=('75cebd7c2f1ed5e5d0985763b255726a9538c602c7c5ca8639707aec54a58683')

build() {
  cd "$srcdir/$_pypiname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pypiname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
