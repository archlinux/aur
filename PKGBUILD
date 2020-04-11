pkgbase="sleep_forever"
pkgname="sleep_forever"
pkgver=1.0
pkgrel=1
pkgdesc="sleep_forever does what the name suggests! Use cases: setting it as shell so you could login and not quit -- so SSH doesn't quit and you could port-forward" 
arch=('any')
url="https://gist.github.com/rany0/4746bf432e4aef2be2336fa5d86f763f"
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
	cc sleep_forever.c -o sleep_forever
}

package () {
	install -Dm755 sleep_forever "$pkgdir/usr/bin/sleep_forever"
}
