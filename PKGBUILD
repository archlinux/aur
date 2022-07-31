# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: alejandrogomez <alejandroogomez@gmail.com>

pkgbase=pyhn
pkgname=pyhn
pkgver=0.3.11
pkgrel=2
pkgdesc="Hacker News command line client"
arch=('any')
url="https://pypi.python.org/pypi/pyhn/"
license=('AGPL3')
depends=('python-urwid' 'python-beautifulsoup4')
source=(https://pypi.io/packages/source/p/$pkgbase/$pkgbase-$pkgver.tar.gz)
md5sums=('e742e4cc9b29bc4fdcccbbd94d83a486')


build() {
  cd ${pkgbase}-${pkgver}
  python setup.py build
}

package() {
  cd ${pkgbase}-${pkgver}
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
}
