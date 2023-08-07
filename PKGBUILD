# Maintainer: Specter119 <spcter119 AT gmail.com>

pkgname=jupyterlab-lsp
pkgver=4.2.0
pkgrel=2
pkgdesc='Coding assistance for JupyterLab with Language Server Protocol.'
arch=(any)
url=https://pypi.org/project/$pkgname
license=(MIT)
depends=(python jupyter-lsp jupyterlab)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('3aab01c8cac040a8d3a9ebfa4085223b054b7fbd6219d3c7b560f6a9766ca2f3')

build() {
  cd $srcdir/$pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $srcdir/$pkgname-$pkgver
  python -m installer --destdir=$pkgdir dist/*.whl
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
