# Maintainer: Anatol Pomozov
# Contributor: Jens Adam (byte/jra) <jra@byte.cx>

pkgname=tinyserial
pkgver=20090305
pkgrel=5
pkgdesc="Small minicom replacement for accessing serial ports on Linux inspired by FreeBSD 'tip'"
url="http://brokestream.com/tinyserial.html"
license=('BSD')
arch=('x86_64')
depends=('glibc')
source=("http://brokestream.com/com.c")
sha1sums=('720a3ec74eddd6799c0ca55ef50479a160a55b73')
sha256sums=('fc4fe874879e303246427922dc40b5fc774b41bdf2a86bd8c6bb7dd8321201eb')

build() {
  gcc $CFLAGS $LDFLAGS -o com com.c
}

package() {
  install -D com "$pkgdir/usr/bin/com"

  sed -n '16,36p' com.c > license.txt
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/tinyserial/license.txt"
}
