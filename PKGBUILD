# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)

pkgname=getmail
pkgver=5.15
pkgrel=1
pkgdesc='POP3 mail retriever with reliable Maildir and command delivery'
arch=('any')
url="http://pyropus.ca/software/$pkgname"
license=('GPL2')

depends=('python2')
optdepends=('python2-gnomekeyring: for storing passwords in gnome-keyring')

changelog=CHANGELOG
source=("$url/old-versions/$pkgname-$pkgver.tar.gz")
sha256sums=('d453805ffc3f8fe2586ee705733bd666777e53693125fdb149494d22bd14162a')


build() {
  cd "$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python2 setup.py install --skip-build --root="$pkgdir"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
