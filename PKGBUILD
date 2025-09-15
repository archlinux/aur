# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>
# Maintainer: Shresth Paul (SecByShresth) <shresthpaul133@gmail.com>

pkgname=python-reparser
_pkgname=reparse
pkgver=3.0
pkgrel=1
pkgdesc="Simple regex-based lexer/parser for inline markup"
arch=('any')
url="https://github.com/xmikos/reparser"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/08/fe/2822999b3ae6295ae91fb67d7feb640a26138714bd1f64551a1a87a4dfc5/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('6188c2306c20867ed2c464667c3835cb47c6b217ed5f659b53756dba253b28ce')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
