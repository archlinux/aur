# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)


pkgname=dirsearch

pkgver=0.4.1
pkgrel=1

pkgdesc='Web path scanner/fuzzer, written in Python'
arch=('any')
url="https://github.com/maurosoria/$pkgname"
license=('GPL2')

depends=('python')

changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tgz::$url/archive/v$pkgver.tar.gz")
b2sums=('32208874a95611f51d5efbaa0d0d50e58105998d9781b46c67db5f3b6e6f97d7d997a22ae6eb9001ebff7dea93edc1383d0c3a789abe3d8244fdbd8a4f398224')


prepare() {
  cd "$pkgname-$pkgver"
  sed -i 's/^# \(save-logs-home.*$\)/\1/' default.conf
}

package() {
  cd "$pkgname-$pkgver"
  install -dm755 "$pkgdir"/usr/{bin,{share/doc/,lib/}$pkgname}
  cp -a * "$pkgdir/usr/lib/$pkgname/"
  install -m644 *.md "$pkgdir/usr/share/doc/$pkgname/"
  ln -s /usr/lib/$pkgname/$pkgname.py "$pkgdir/usr/bin/$pkgname"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
