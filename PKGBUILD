pkgname=imapdedup
pkgver=20160410
pkgrel=1
pkgdesc="IMAP folder deduplicator"
arch=(any)
url="https://github.com/quentinsf/IMAPdedup"
license=('GPL2')
depends=('python2')
source=(git://github.com/quentinsf/IMAPdedup.git)
md5sums=('SKIP')

prepare() {
  cd "$srcdir/IMAPdedup"
  sed -i 's|#! /usr/bin/env python|#! /usr/bin/env python2|' imapdedup.py
}

package() {
  cd "$srcdir/IMAPdedup"
  install -Dm0755 imapdedup.py $pkgdir/usr/bin/imapdedup
  install -Dm0755 README.md $pkgdir/usr/share/doc/imapdedup/README.md
}
