# Maintainer: Thomas Andrejak <thomas.andrejak@gmail.com>

pkgname=prelude-lml-rules
pkgver=3.0.1
pkgrel=1
pkgdesc="Prelude LML community ruleset"
arch=('i686' 'x86_64')
url="http://www.prelude-siem.org"
license=('GPLv2')
depends=('prelude-lml')
source=("https://www.prelude-siem.org/pkg/src/3.0.0/$pkgname-$pkgver.tar.gz")
backup=('etc/prelude-lml/ruleset/pcre.rules')

package() {
  cd "$srcdir"/$pkgname-$pkgver
  install -d -m 0700 "$pkgdir/etc/prelude-lml"
  install -d -m 0700 "$pkgdir/etc/prelude-lml/ruleset"
  install -d -m 0755 "$pkgdir/usr/bin"
  install -m 0600 ruleset/*.rules "$pkgdir/etc/prelude-lml/ruleset/"
  install -m 0755 src/prelude-lml-rules-check "$pkgdir/usr/bin/"
}

md5sums=('99f00d4f518a54a8a4735dee8b864aad')
