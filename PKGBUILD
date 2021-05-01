# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=python-slack-sdk
pkgver=3.5.0
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
sha256sums=('b2a12103ee32fa37b8fea1b7e347b5e812c1c3924b006c7025d7f481c53f3865')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" -O1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
