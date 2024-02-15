# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=unidump
pkgver=1.1.2
pkgrel=1
pkgdesc='hexdump for Unicode data.'
arch=('any')
url='https://github.com/Codepoints/unidump'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
conflicts=('unidump-git')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
b2sums=('d6daad3853702936f8c1020ac47eb52fbd36af45edf24f16b4344496a0869e7ad923a8c5fbf7165c71d8cbfe186d1c21631f9b58c54ead6be85591d929c6b62a')

build() {
  cd "$pkgname-$pkgver"

  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"

  python setup.py install --root="$pkgdir" --prefix=/usr -O1 --skip-build
}
