# Maintainer: Arvid Norlander <VorpalBlade@users.noreply.github.com>
pkgname=ipw2x00-firmware
pkgver=1.3
pkgrel=1
pkgdesc="Firmware for ipw2100 and ipw2200 drivers"
arch=(any)
url="http://ipw2200.sourceforge.net/firmware.php"
license=('custom')
makedepends=('git')
source=(${pkgname}'::git+https://github.com/VorpalBlade/ipw2x00-firmware.git#commit=5dcd813fa495b15a1643715300313f4d16037f6b')
noextract=()
md5sums=('SKIP')

build() {
	cd "$srcdir/${pkgname}"
	make
}

package() {
	cd "$srcdir/${pkgname}"
	make DESTDIR="$pkgdir/" install
}
