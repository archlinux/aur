# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=python-slack-sdk
pkgver=3.10.1
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
sha256sums=('6c47e01bd1fc688d63f761b071960a887589ba00c3dfc81dfc2cfc1dbb215722')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" -O1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
