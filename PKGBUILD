# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-priority
pkgver=2.0.0
pkgrel=3
pkgdesc='A pure-Python implementation of the HTTP/2 priority tree'
arch=('any')
license=('MIT')
url='https://github.com/python-hyper/priority'
depends=('python38')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest-runner' 'python38-hypothesis')
source=("https://github.com/python-hyper/priority/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('be22788a76049a8822f5a307f2b00948ac0555d0b6dd629686de90de482295806d071d1731bcdbfdc0f98abbb5aba7d2e947f478b479b72580e7ce1d19d684bb')

build() {
  cd priority-$pkgver
  python3.8 setup.py build
}

check() {
  cd priority-$pkgver
  python3.8 setup.py pytest
}

package() {
  cd priority-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
