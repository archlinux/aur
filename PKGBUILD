# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=aptik
pkgver=18.8
pkgrel=2
pkgdesc="Command-line tool for migrating system settings and data for distributions based on Debian, Arch and Fedora."
arch=('i686' 'x86_64')
url="https://github.com/teejee2008/aptik"
license=('GPL3')
depends=('glib2' 'libgee' 'pv')
makedepends=('git' 'vala')
source=("${pkgname}_v${pkgver}.tgz::https://github.com/teejee2008/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('9439d9f0601a799848c786435a51d276acd14d62dea91ab4d91f57994661ab73')

build() {
	cd "${pkgname}-${pkgver}"
	make all
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir/" install
}
