# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)


pkgname=getmail6

pkgver=6.4
pkgrel=1

pkgdesc='POP3 mail retriever with reliable Maildir and command delivery; Python 3 port'
arch=('any')
url="http://$pkgname.org"
license=('GPL2')

provides=("getmail=$pkgver")
conflicts=('getmail')

makedepends=('git')
depends=('python-chardet')

changelog=CHANGELOG
source=("$pkgname-$pkgver.tgz::https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz")
b2sums=('fd4f6cd4e52967c1c85c24cfa2fd95a8c794d6d4ce93e6af0855ff46654945941bc11d0c213eeb8bc6e8917d566d6ddfe55e3c16ec1a210dc0a004febb14490e')


build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --skip-build --optimize=1 --root="$pkgdir"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
