# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=jupyterlab-language-pack-no-no
pkgdesc='Norwegian Bokmål (Norway) language pack for JupyterLab'
url='https://github.com/jupyterlab/language-packs/'
pkgver=4.0.post0
pkgrel=1
arch=('any')
license=('BSD')

makedepends=('jupyterlab-translate' 'python-build' 'python-hatchling' 'python-installer')

_pypi=jupyterlab_language_pack_no_no
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
  '8d96d86facb67789aba5760f21b035a479d53606f09d2c6d3789884fa98e799a'
)

build() {
  cd "$_pypi-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pypi-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
