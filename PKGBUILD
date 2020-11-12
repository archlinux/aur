# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-editdistance
pkgver=0.5.3
pkgrel=5
pkgdesc="Fast implementation of the edit distance(Levenshtein distance)"
arch=('x86_64')
license=('MIT')
url="https://github.com/aflc/editdistance"
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aflc/editdistance/archive/v$pkgver.tar.gz"
        LICENSE)
sha512sums=('e870967383a7b6f0f6994b0c5123907da1b50e4c7ee9f3cdc958dc1ba5e92501a427dbd0d3e8a3e7f1fecc562659f3a952a47669f2037d2e4cad09654b33d31f'
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
