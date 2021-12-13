# Maintainer:  a.kudelin <kudelin at protonmail dot com>
# Contributor: vsilv <vsilv@posteo.eu>

_pkgname=quandl
pkgname=python-$_pkgname
pkgver=3.4.8
pkgrel=2
pkgdesc="Quandl's Python Package"
arch=('any')
url="https://github.com/quandl/quandl-python"
license=('MIT')
depends=('python-numpy' 'python-more-itertools' 'python-inflection')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('d885a269ccea7f4e6c6965fb31277f003c4d00bcdf947e6fe9c4f3b6e09d116e')

build() {
  cd "$srcdir/$_pkgname-python-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-python-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" -O1 --skip-build
  install -Dm755 LICENSE.txt -t \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
