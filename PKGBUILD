# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=jupyterlab-language-pack-de-de
pkgdesc='German (Germany) language pack for JupyterLab'
url='https://github.com/jupyterlab/language-packs/tree/master/language-packs/jupyterlab-language-pack-de-DE'
pkgver=4.2.post2
pkgrel=1
arch=('any')
license=('BSD-3-Clause')

makedepends=('jupyterlab-translate' 'python-build' 'python-hatchling' 'python-installer')

_pypi=jupyterlab_language_pack_de_de
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
  '6e29ef9801b64a96603f0235499b612740094e0e270c740a31ccb9fbb15af8e7'
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
