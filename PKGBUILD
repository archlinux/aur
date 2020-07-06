# Maintainer: Anton Kudelin <kudelin at protonmail dot com>
# Contributor: Clint Valentine <valentine.clint@gmail.com>

pkgname=python-slackclient
pkgver=2.7.2
pkgrel=1
pkgdesc="Slack Python SDK"
arch=('any')
url="https://slack.dev/$pkgname"
license=('MIT')
depends=('python-aiohttp')
optdepends=('python-aiodns')
makedepends=('python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/slackapi/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('6dc297228eb1237c939e8248da0f3d0ef72614940b4a4c62af796759f92c88e4')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" -O1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
