# Maintainer: IRRatium <your@email.com>

pkgname=python-cloudtips
pkgver=0.4.1
pkgrel=1
pkgdesc="Unofficial async Python library for CloudTips — receive donations and listen to new payments in real time"
arch=('any')
url="https://github.com/IRRatium/cloudtips-api"
license=('MIT')
depends=(
  'python'
  'python-aiohttp'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-hatchling'
)
source=("https://files.pythonhosted.org/packages/source/c/cloudtips/cloudtips-$pkgver.tar.gz")
sha256sums=('3e4bcc79928c5b28c42c44d6539d3260a78ceae5d202e056a77313a38230eaa3')

build() {
  cd cloudtips-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd cloudtips-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
