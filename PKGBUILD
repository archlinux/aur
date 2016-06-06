# Maintainer: X0rg
# Contributor: marlock <marlock87@hotmail.com>
# Contributor: Diogo Leal <estranho@diogoleal.com>

pkgname=psensor
pkgver=1.1.5
pkgrel=1
pkgdesc="A graphical hardware temperature monitor for Linux"
arch=('i686' 'x86_64')
url="http://wpitchoune.net/psensor"
license=('GPL2')
depends=('lm_sensors' 'dconf' 'gtk3>=3.4' 'udisks2')
makedepends=('help2man')
optdepends=('asciidoc: required to produce the HTML version of the FAQ'
	'libnotify: support for notifications on desktop'
	'libappindicator3: allow Psensor to export a menu into the Unity Menu bar'
	'libxnvctrl: NVIDIA X Ctrl library'
	'json-c: required for remote monitoring'
	'curl: required for remote monitoring'
	'libgtop: required for CPU usage')
conflicts=('libappindicator-gtk2' 'libappindicator-activate-gtk2' 'libappindicator-gtk2-ubuntu' 'lib32-libappindicator-gtk2')
source=("http://wpitchoune.net/$pkgname/files/$pkgname-$pkgver.tar.gz")
md5sums=('db6fa7496576b63979c1c6e5e707142e')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
