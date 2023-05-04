# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=python-sphinx_rtd_dark_mode
pkgver=1.2.4
pkgrel=1
pkgdesc='Adds a toggleable dark mode to the Read the Docs theme.'
arch=('any')
url='https://github.com/MrDogeBro/sphinx_rtd_dark_mode'
license=('MIT')
depends=('python-sphinx_rtd_theme')
makedepends=('python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('7aa68205af0578b841d35e7d7ccc8278060eafa13a598889dde6e75c3b27f606ffd7eac0c4bcc946b7e83bd2099e83c5b212768f230cabfcc6a8a0248b8f8ebc')
_srcdir="sphinx_rtd_dark_mode-${pkgver}"

build() {
  cd "$_srcdir"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_srcdir"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
