# Maintainer: SteamedFish <steamedfish@hotmail.com>
pkgname=python-mosestokenizer
pkgver=1.2.1
pkgrel=1
pkgdesc="Wrappers for several pre-processing scripts from the Moses machine translation toolkit"
arch=('any')
url="https://github.com/luismsgomes/mosestokenizer"
license=('LGPL-2.1-or-later')
depends=(
  'python'
  'perl'
  'python-docopt'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("https://files.pythonhosted.org/packages/8d/84/4f3c1b5b8d796a07e3816cd41f7b1491e2291db4ade5f17b850116fd80e5/mosestokenizer-${pkgver}.tar.gz")
sha256sums=('438b3e35a221f7930c408e97e3f38af6d0cec74b991eb9edb00a44e3510e836d')

build() {
  cd "mosestokenizer-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "mosestokenizer-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 PKG-INFO "$pkgdir/usr/share/licenses/$pkgname/PKG-INFO"
}
