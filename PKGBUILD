# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=python-slack-sdk
pkgver=3.0.0
pkgrel=1
pkgdesc="Slack Python SDK"
arch=('any')
url="https://slack.dev/$pkgname"
license=('MIT')
depends=('python-aiohttp')
optdepends=('python-aiodns')
makedepends=('python-setuptools' 'python-wheel')
replaces=('python-slackclient')
source=("$pkgname-$pkgver.tar.gz::https://github.com/slackapi/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('0f4625c0cfc0cddec444d5d038295548cde3b34f87127040ae5a2bfbf4ae2312')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" -O1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
