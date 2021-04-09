# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Yaron de Leeuw <me@jarondl.net>

pkgname=python2-isort
pkgver=4.3.21
pkgrel=1
pkgdesc="A Python utility / library to sort Python imports."
arch=('any')
url="https://github.com/timothycrosley/isort"
license=('MIT')
depends=('python2-futures' 'python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/timothycrosley/isort/archive/$pkgver.tar.gz")
sha512sums=('a393956a997687996b025c2a37c655efebdd988c52f6d6914db79613a5e0febbf92b0c6007c6db07af079db78e4c235cad0578089b565cb474cdfbbac9031e6d')

build() {
  cd isort-$pkgver
  python2 setup.py build
}

package() {
  cd isort-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  mv "$pkgdir"/usr/bin/isort{,2}
}
