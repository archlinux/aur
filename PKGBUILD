# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=jupyterlab-language-pack-de-de
pkgdesc='German (Germany) language pack for JupyterLab'
url='https://github.com/jupyterlab/language-packs/tree/master/language-packs/jupyterlab-language-pack-de-DE'
pkgver=4.2.post3
pkgrel=1
arch=('any')
license=('BSD-3-Clause')

makedepends=(
  'jupyterlab-translate'
  'python-build'
  'python-hatchling'
  'python-installer'
)

_pypi=jupyterlab_language_pack_de_de
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
  'd2899633d6bf4227d5524eeff809375a185568451f8edceedf27278f7668605a'
)

build() {
  cd "$_pypi-$pkgver"
  python -m build --wheel --no-isolation -x
}

package() {
  cd "$_pypi-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
