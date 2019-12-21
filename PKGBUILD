# Maintainer: Anton Kudelin <kudelin at protonmail dot com>
# Contributor: Clint Valentine <valentine.clint@gmail.com>

pkgname=python-slackclient
pkgver=2.5.0
pkgrel=1
pkgdesc="Slack Python SDK"
arch=('any')
url="https://slack.dev/$pkgname"
license=('MIT')
makedepends=('python-setuptools')
source=("https://github.com/slackapi/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('6c465aef49e17307bd8198c122936f4873aef03d3d14a810cd79a95d50253cdd')

build(){
  cd $srcdir/$pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
