pkgbase="sleep_forever"
pkgname="sleep_forever"
pkgver=1.0
pkgrel=2
pkgdesc=""
arch=('any')
url=""
license=("unknown")
provides=("$pkgname")
conflicts=("$pkgname")

build () {
	cat > sleep_forever.c << 'EOL'
#include <limits.h>
#include <unistd.h>

int main() {
 while (1) {
  sleep(UINT_MAX);
 }
 return 0;
}
EOL
	gcc $CFLAGS sleep_forever.c -o sleep_forever
}

package () {
	install -Dm755 sleep_forever "$pkgdir/usr/bin/sleep_forever"
}
