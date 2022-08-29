# Maintainer : Sandro CAZZANIGA <cazzaniga.sandro@gmail.com>
# Contributor :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)

pkgname=getmail
pkgver=5.16
pkgrel=1
pkgdesc='POP3 mail retriever with reliable Maildir and command delivery'
arch=('any')
url="http://pyropus.ca/software/$pkgname"
license=('GPL2')

depends=('python2')
optdepends=('python2-gnomekeyring: for storing passwords in gnome-keyring')

changelog=CHANGELOG
source=("$url/old-versions/$pkgname-$pkgver.tar.gz")
sha256sums=('6ae8f8eaef9abc465050c3b64e55a31afbdcd4c6edf3197b5b59bbd56ca667fa')


build() {
  cd "$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python2 setup.py install --skip-build --root="$pkgdir"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
