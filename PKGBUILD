# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=columnar
pkgname="python-$_pkgname"
pkgver=1.4.1
pkgrel=1
pkgdesc="A tool for printing data in a columnar format."
arch=('any')
url="https://pypi.org/project/$_pkgname"
license=('MIT')
depends=('python' 'python-toolz' 'python-wcwidth')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MaxTaggart/columnar/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b069d20ad91ea831d1ee072b57c2c6cbf5e53e3df0d9e05f13512ac207da0336')
b2sums=('3d2792a6d9f5d6c0848fa97353d9fb349fb949ba421b3e11ff3484a1a185dd1bf9edeb99375f6d60d4821e299fd8a12a0acaa0b5a6e40fe40c0896f014119281')

build() {
  cd "$_pkgname-$pkgver"

  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
