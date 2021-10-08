# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=jupyterlab-language-pack-de-de
_pypi=jupyterlab-language-pack-de-DE
pkgdesc='German (Germany) language pack for JupyterLab'
url='https://github.com/jupyterlab/language-packs/tree/master/language-packs/jupyterlab-language-pack-de-DE'
pkgver=3.1.post2
pkgrel=1
arch=('any')
license=('BSD')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/j/$_pypi/$_pypi-$pkgver.tar.gz")
sha256sums=('66d48879f32b5863104cab7b8b47e2026e5c94722e0d2c7ec418fcfc08782f7e')

build() {
  cd "$_pypi-$pkgver"
  python setup.py build
}

package() {
  cd "$_pypi-$pkgver"
  python setup.py install --skip-build --optimize=1 --root="$pkgdir"
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
