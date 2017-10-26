# Maintainer: SanskritFritz (gmail)

pkgname=iprange
pkgver=1.0.4
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

md5sums=('13a9b5ea2f311b6238d14b0a3ba7c760')
