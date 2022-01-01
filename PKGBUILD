# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-editdistance
pkgver=0.6.0
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
sha512sums=('1b2b0a23edc752564ddb19f7625e227fc7ea5b6e838da014effdec0edbcca2f2ad02460817638e7ea6d5857f71e3eb8af6fd94d936e6d26fe1d7dcad446ea573'
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
