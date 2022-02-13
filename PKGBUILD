# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=python-slack-sdk
pkgver=3.14.1
pkgrel=1
pkgdesc="Slack Python SDK"
arch=('any')
url="https://slack.dev/$pkgname"
license=('MIT')
depends=('python-aiohttp')
optdepends=('python-aiodns')
makedepends=('python-setuptools' 'python-wheel')
replaces=('python-slackclient')
conflicts=('python-slackclient')
source=("$pkgname-$pkgver.tar.gz::https://github.com/slackapi/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('453381ef9d8763971876662fc70dcb37a083aed4cd60587a30d35ec906df2fed')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" -O1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
