# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Maintainer: Specter119 <spcter119 AT gmail.com>

pkgname=jupyterlab-lsp
pkgver=5.1.0
pkgrel=1
pkgdesc="Coding assistance for JupyterLab with Language Server Protocol."
arch=(any)
url="https://github.com/jupyter-lsp/jupyterlab-lsp"
license=(BSD-3-Clause)
depends=(python jupyter-lsp jupyterlab)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('aeac84093ada6d20ef57ae0e97811cc5796a0cab7237b32f8eddf993c0bb0356')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir=$pkgdir dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
