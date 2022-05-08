# Maintainer: zpyg <pu.mb@qq.com>

pkgname=jupyterlab-language-pack-zh-cn
_pypi=jupyterlab-language-pack-zh-CN
pkgdesc='Simplified Chinese(简体中文) language pack for JupyterLab'
url="https://github.com/jupyterlab/language-packs/tree/master/language-packs/$_pypi"
pkgver=3.3.post4
pkgrel=1
arch=('any')
license=('BSD')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz")
sha256sums=('0e13fad7764f3ae9216e746984e21c7253c8b40f81e0c42c2ddaf48e39f0fed8')

build() {
  cd "$_pypi-$pkgver"
  python setup.py build
}

package() {
  cd "$_pypi-$pkgver"
  python setup.py install --skip-build --optimize=1 --root="$pkgdir"
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
