# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=jupyterlab-language-pack-no-no
_pypi=jupyterlab-language-pack-no-NO
pkgdesc='Norwegian Bokmål (Norway) language pack for JupyterLab'
url="https://github.com/jupyterlab/language-packs/tree/master/language-packs/$_pypi"
pkgver=3.2.post4
pkgrel=1
arch=('any')
license=('BSD')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/j/$_pypi/$_pypi-$pkgver.tar.gz")
sha256sums=('aff86067816fd11cfa4897c01c97e5062ebc6ceb891b6c3adc4ef62cae34ae57')

build() {
  cd "$_pypi-$pkgver"
  python setup.py build
}

package() {
  cd "$_pypi-$pkgver"
  python setup.py install --skip-build --optimize=1 --root="$pkgdir"
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
