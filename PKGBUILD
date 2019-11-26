# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)


pkgname=dirsearch

pkgver=0.3.9
pkgrel=1

pkgdesc='Web path scanner/fuzzer, written in Python'
arch=('any')
url="https://github.com/maurosoria/$pkgname"
license=('GPL2')

depends=('python')

changelog=CHANGELOG.md
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('a832d94d919b9976352222a145e6df4a8195e93facd4d8eae201ed55959f2947')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i 's/^#\(save-logs-home.*$\)/\1/' default.conf
}

package() {
  cd "$pkgname-$pkgver"
  install -dm755 "$pkgdir"/usr/{bin,{share/doc/,lib/}$pkgname}
  cp -a * "$pkgdir/usr/lib/$pkgname/"
  install -m644 *.md "$pkgdir/usr/share/doc/$pkgname/"
  ln -s /usr/lib/$pkgname/$pkgname.py "$pkgdir/usr/bin/$pkgname"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
