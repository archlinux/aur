# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-editdistance
pkgver=0.6.1
pkgrel=1
pkgdesc="Fast implementation of the edit distance(Levenshtein distance)"
arch=('x86_64')
license=('MIT')
url="https://github.com/aflc/editdistance"
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aflc/editdistance/archive/v$pkgver.tar.gz"
        LICENSE)
sha512sums=('23aa478a3ca7ca7aaba547f84119471a9035d403628814c7bed747fbd19638e78260b545a11d049d7b38d6579be66cd60bf25e70bd4b168814b5161af4bc14d0'
            '590232c1e7fa5aaaaa77573c4ea23533522177ca0ac07a0ce7f00e446d47467df2e19936ecb5e057fddc664d1daca39e2217cb5f6e3192ef5edf49b1f73e0f10')

build() {
  cd editdistance-$pkgver
  python setup.py build
}

check() {
  cd editdistance-$pkgver
  python setup.py nosetests
}

package() {
  cd editdistance-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
