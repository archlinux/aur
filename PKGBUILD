# Maintainer :  Kr1ss  $(tr +- .@ <<<'<kr1ss+x-yandex+com>')


pkgname=getmail6

pkgver=6.13
pkgrel=1

pkgdesc='POP3 mail retriever with reliable Maildir and command delivery; Python 3 port'
arch=('any')
url="http://$pkgname.org"
license=('GPL2')

provides=("getmail=$pkgver")
conflicts=('getmail')

makedepends=('git')
depends=('python-chardet')
optdepends=('python-keyring: secure password store'
            'python-keyrings-alt: alternative backends')

changelog=CHANGELOG
source=("$pkgname-$pkgver.tgz::https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz")
b2sums=('c86340baab155da11a9dc208769501c6c9ef77e29e6a5922380b8bc676838d0a9c11a966966062ecfcd10f3108e6d07a196eddcca9a1ccd3d3e8bbea1d9cf891')


build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --skip-build --optimize=1 --root="$pkgdir"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
