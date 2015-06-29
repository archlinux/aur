# Contributor:  TDY <tdy@archlinux.info>
# Contributor: skorpan <kristnjov__gmail>
# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=bdfedit
pkgver=1.3
pkgrel=3
pkgdesc="A BDF font editor"
arch=('any')
url="http://hea-www.harvard.edu/~fine/Tech/bdfedit.html"
license=('custom')
depends=('tk>7.6')
source=(http://hea-www.harvard.edu/~fine/Tech/$pkgname$pkgver.tar.gz
        $pkgname-$pkgver.diff $pkgname.desktop $pkgname.png COPYING)
sha256sums=('ac5cfac845827b721af02791615363eae07b89cf290d12bd0734174fcc8ed0d6'
            '538e674dfca72c8486590bd2f741cc231f2762257d8970b72916843dab38bc51'
            '7ef8c9f9722f221546dc0af38f87c2381a48e2219573770629387f751270775b'
            '65c883f934a8a350605699e6ea8905e06c3a1f027ebd15a7a2b67a31a2792028'
            '1ebbeaca53852f9a5bd362fc6833be1b2b9f2c795a76c618d2034b3b328e0073')

package() {
  cd "$srcdir/$pkgname$pkgver"
  patch -Np1 -i ../$pkgname-$pkgver.diff
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 completion.tcl "$pkgdir/usr/share/$pkgname/completion.tcl"
  install -Dm644 $pkgname.samprc "$pkgdir/etc/bdfeditrc"
  install -Dm644 $pkgname.help "$pkgdir/usr/share/doc/$pkgname/readme.txt"
  install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 ../$pkgname.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 ../$pkgname.desktop  "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# vim:set ts=2 sw=2 et:
