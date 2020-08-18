# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)


pkgname=getmail6

pkgver=6.03
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
b2sums=('d5c57766f0895b996dc240c673e9b8279aa4341f9e82acb8b276159e99f3cdd58a17beb6906f70afc64ba6de9f09a012b8649597721c2fbb8525655777287c75')


prepare() {
  cd "$pkgname-$pkgver"
  sed -i '/docs\/TODO/d' setup.py MANIFEST.in
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --skip-build --optimize=1 --root="$pkgdir"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
