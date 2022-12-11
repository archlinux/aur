# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=python-slack-sdk
pkgver=3.19.5
pkgrel=1
pkgdesc="Slack Python SDK"
arch=('any')
url="https://slack.dev/$pkgname"
license=('MIT')
depends=('python-aiohttp')
optdepends=('python-aiodns')
makedepends=('python-setuptools')
checkdepends=('python-flask' 'python-flask-sockets' 'python-moto')
replaces=('python-slackclient')
conflicts=('python-slackclient')
source=("$pkgname-$pkgver.tar.gz::https://github.com/slackapi/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('30f10d6dcedbb1c15e085da41d66f5f2ea398d078734a6b5ef441ba5b2f924fa')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" -O1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
