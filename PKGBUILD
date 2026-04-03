# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=python-ultimate-sitemap-parser
_pkgname=ultimate-sitemap-parser
pkgver=1.8.0
pkgrel=1
pkgdesc="A performant library for parsing and crawling sitemaps"
arch=('any')
url="https://github.com/GateNLP/ultimate-sitemap-parser"
license=('GPL-3.0-or-later')
depends=('python' 'python-dateutil' 'python-requests')
makedepends=('python-build' 'python-installer')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/GateNLP/ultimate-sitemap-parser/archive/$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
