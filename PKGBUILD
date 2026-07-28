# Maintainer: SanskritFritz (gmail)

pkgname=iprange
pkgver=2.1.1
pkgrel=1
pkgdesc="Manage IP ranges. From the FireHOL project."
url="http://firehol.org/"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
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

md5sums=('1cecfd1f6c3161aaf1eff914690208cf')
