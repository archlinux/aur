# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-behave
pkgver=1.2.7.dev2
pkgrel=1
pkgdesc="Behaviour-driven development, Python style"
url="https://github.com/behave/behave"
license=('BSD')
arch=('any')
depends=('python-cucumber-tag-expressions' 'python-parse' 'python-parse-type' 'python-six'
         'python-colorama')
makedepends=('python-setuptools')
checkdepends=('python-mock' 'python-path' 'python-pyhamcrest' 'python-pytest' 'python-pytest-html')
source=("https://github.com/behave/behave/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('5c4bba820fa1a6691ae275e3adb0b6077a1957686a9ee205d471ffddc9601b32e5b2f47cd2b3e2d7a72a31c39f171c3b2af524d7f787243585d4d95086675118')

build() {
  cd behave-$pkgver
  python setup.py build
}

check() {
  cd behave-$pkgver
  pytest
}

package() {
  cd behave-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
