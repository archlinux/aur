# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-rfc3339-validator
pkgver=0.1.4
pkgrel=3
pkgdesc="A pure python RFC3339 validator"
url="https://github.com/naimetti/rfc3339-validator"
license=('MIT')
arch=('any')
depends=('python38-six')
makedepends=('python38-setuptools')
checkdepends=('python38-hypothesis' 'python38-pytest-runner' 'python38-strict-rfc3339')
source=("https://github.com/naimetti/rfc3339-validator/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('ed593b31c4984cdbc313e42dc0432173eaa649712e29627ab462dfa262efb30cee97b74f589d3d211c2193623fac3baca560a52a7a3f718071a63482e06c4203')

build() {
  cd rfc3339-validator-$pkgver
  python3.8 setup.py build
}

check() {
  cd rfc3339-validator-$pkgver
  python3.8 setup.py pytest
}

package() {
  cd rfc3339-validator-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
