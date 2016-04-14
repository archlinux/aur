# Maintainer: SanskritFritz (gmail)

pkgname=iprange
pkgver=1.0.2
pkgrel=2
pkgdesc="Manage IP ranges. From the FireHOL project."
url="http://firehol.org/"
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
depends=('glibc')
makedepends=('git' 'help2man')
source=("https://github.com/firehol/iprange/archive/v$pkgver.tar.gz")

build() {
	cd "$pkgname-$pkgver"

	./autogen.sh
	./configure --enable-maintainer-mode --prefix="/usr" --sysconfdir="/etc" --sbindir="/usr/bin"
	make
}

package() {
	cd "$pkgname-$pkgver"

	make prefix="$pkgdir/usr" sysconfdir="$pkgdir/etc" sbindir="$pkgdir/usr/bin" install
}

md5sums=('28220cd0c0a96cb9a5f727aa96744cf6')
