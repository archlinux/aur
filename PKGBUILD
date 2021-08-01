# Maintainer: Ke Liu <spcter119 AT gmail.com>

pkgname=jupyter-lsp
pkgver=1.4.0
pkgrel=1
pkgdesc='Multi-Language Server WebSocket proxy for Jupyter Notebook/Lab server.'
arch=(any)
url=https://pypi.org/project/$pkgname
license=(MIT)
depends=(python jupyter-server)
makedepends=(python-setuptools)
optdepends=(
  bash-language-server
  javascript-typescript-langserver
  jedi-language-server
  python-language-server
  python-lsp-server
  pyright
  r-languageserver
  texlab
  sql-language-server
  vscode-css-languageserver-bin
  vscode-json-languageserver-bin
  yaml-language-server)
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('baf12d9a7cc95d03e9c5d9c871fd7ff3d1202a889b322b155032eb3f677fb487')

build() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --root $pkgdir --skip-build --optimize=1
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
