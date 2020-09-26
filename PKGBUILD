# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)


pkgname=dirsearch

pkgver=0.4.0
pkgrel=1

pkgdesc='Web path scanner/fuzzer, written in Python'
arch=('any')
url="https://github.com/maurosoria/$pkgname"
license=('GPL2')

depends=('python')

changelog=CHANGELOG.md
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('bc357898943dbcf3cdeed3c9385e70b54c78af9e115e17f2a69da38a73e51dc29a1aa968b8dc76969c0c690cec81f1aecec3c3baf40ddc36d7fd62a5bc1f76bd')


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
