# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-colander
pkgver=1.8.2
pkgrel=1
pkgdesc="A simple schema-based serialization and deserialization library"
url="https://docs.pylonsproject.org/projects/colander/en/latest/"
license=('BSD')
arch=('any')
depends=('python-iso8601' 'python-setuptools' 'python-translationstring')
checkdepends=('python-pytest-cov' 'python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Pylons/colander/archive/$pkgver.tar.gz")
sha512sums=('37c5501906c00ba58da41c98a86837f42d2738ff37f7b904ded9ac2fb1dd843c2fad159bb7033dd68b6d180d779eca57908ddef874ba23be35511faa8c91b4d6')

build() {
  cd colander-$pkgver
  python setup.py build
}

check() {
  cd colander-$pkgver
  python setup.py pytest
}

package() {
  cd colander-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
