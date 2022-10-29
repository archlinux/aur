# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=jupyterlab-language-pack-de-de
_pypi=jupyterlab-language-pack-de-DE
pkgdesc='German (Germany) language pack for JupyterLab'
url='https://github.com/jupyterlab/language-packs/tree/master/language-packs/jupyterlab-language-pack-de-DE'
pkgver=3.5.post1
pkgrel=1
arch=('any')
license=('BSD')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz")
sha256sums=('e3788d1ab9cb37d4a0f4c7282328c5d5a26f4e541c3b28c341166d4fd4c4cc27')

build() {
  cd "$_pypi-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pypi-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
