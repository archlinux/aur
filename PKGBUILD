# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=jupyterlab-language-pack-no-no
_pypi=jupyterlab-language-pack-no-NO
pkgdesc='Norwegian Bokmål (Norway) language pack for JupyterLab'
url="https://github.com/jupyterlab/language-packs/tree/master/language-packs/$_pypi"
pkgver=3.4.post5
pkgrel=1
arch=('any')
license=('BSD')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz")
sha256sums=('185f7eba991e44e4c8b0387dae7fb810288299319126398833b75a3620e45bd0')

build() {
  cd "$_pypi-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pypi-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
