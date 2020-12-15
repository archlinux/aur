# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-behave
pkgver=1.2.7.dev1
pkgrel=1
pkgdesc="Behaviour-driven development, Python style"
url="https://github.com/behave/behave"
license=('BSD')
arch=('any')
depends=('python-cucumber-tag-expressions' 'python-parse' 'python-parse-type' 'python-six')
makedepends=('python-setuptools')
checkdepends=('python-mock' 'python-path' 'python-pyhamcrest' 'python-pytest' 'python-pytest-html')
source=("https://github.com/behave/behave/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('a352a2f1594831b3c85a54225e5bd4f425ab06c38e708b6ec65f1c8fb2eb3a92924baa15d5742c344e58ac95773f00393aa1338bd839dd8345f701eb37ce62b6')

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
