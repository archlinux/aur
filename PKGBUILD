# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=jupyterlab-language-pack-no-no
_pypi=jupyterlab-language-pack-no-NO
pkgdesc='Norwegian Bokmål (Norway) language pack for JupyterLab'
url="https://github.com/jupyterlab/language-packs/tree/master/language-packs/$_pypi"
pkgver=3.3.post0
pkgrel=1
arch=('any')
license=('BSD')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz")
sha256sums=('6dc942eb0f87ef96fd062f7161d2cd27339928ed10bf02c0afd4ca9f39cf2a85')

build() {
  cd "$_pypi-$pkgver"
  python setup.py build
}

package() {
  cd "$_pypi-$pkgver"
  python setup.py install --skip-build --optimize=1 --root="$pkgdir"
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
