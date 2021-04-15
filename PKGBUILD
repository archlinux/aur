# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Yaron de Leeuw <me@jarondl.net>

pkgname=python2-isort
pkgver=4.3.21
pkgverfix=-2
pkgrel=2
pkgdesc="A Python utility / library to sort Python imports."
arch=('any')
url="https://github.com/timothycrosley/isort"
license=('MIT')
depends=('python2-futures' 'python2-setuptools')
source=("$pkgname-$pkgver$pkgverfix.tar.gz::https://github.com/timothycrosley/isort/archive/$pkgver$pkgverfix.tar.gz")
sha512sums=('fc2aa00c87196864864d2516b8be7acdedcf40d71d1931510e4b878dbd2b6da0b579661b50221f03f4aa5560c8bf23d5e1e10a2694d2b741ca09a92e40a4c687')

build() {
  cd isort-$pkgver$pkgverfix
  python2 setup.py build
}

package() {
  cd isort-$pkgver$pkgverfix
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  mv "$pkgdir"/usr/bin/isort{,2}
}
