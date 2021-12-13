# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Philipp A. <flying-sheep@web.de>

pkgname=python-stdlib-list
pkgver=0.8.0
pkgrel=2
pkgdesc="A list of Python Standard Libraries"
arch=('any')
url="https://github.com/jackmaney/python-stdlib-list"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('e18d893e257408125249064b9466e50f684a5358d0d8ab1693bf3529f23b47f82dc23b52cea6f8be89c7dc2bac58f8981ace0b7d7a016b295855562dba1aebc3')
b2sums=('856b602fc7041fba987e9801571ecf9ccfafa935375dbc5a3248fd89803981b367fd03874b58a4f173bc6e5ed59e1d0711e54f2f210e640aeebc8c83eabce59d')

build() {
  cd "$pkgname-$pkgver"

  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
