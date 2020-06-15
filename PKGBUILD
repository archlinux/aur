# Maintainer: capnhawkbill <capnhawkbill at airmail dot cc>
# Contributor: Sébastien Luttringer
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Lone_Wolf <lonewolf@xs4all.nl>

pkgname=cfv
pkgver=1.18.3
pkgrel=8
pkgdesc='An utility to both test and create checksum files'
arch=('any')
url='http://cfv.sourceforge.net/'
license=('GPL')
depends=('python2')
source=("https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('dbca82df850703ab68a20db9314475025ac2e7012f34a12abbb358677e81cbb29a465adf4a1b002f6cf1c1dd84f1588fc1072791d6bbaad0c02cc563e5fe7d71')

prepare() {
  cd $pkgname-$pkgver
  patch -p 0 << DIFF
--- cfv
+++ cfv
@@ -1,3 +1,3 @@
-#! /usr/bin/env python
+#! /usr/bin/env python2

 #    cfv - Command-line File Verify
DIFF
}

package() {
  make -C "$pkgname-$pkgver" install=install PYTHON=python2 prefix=/usr \
    mandir=/usr/share/man DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
