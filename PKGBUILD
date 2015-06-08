# Contributor: graysky <graysky AT archlinux dot us>
pkgname=hosts-update
pkgver=1.35
pkgrel=1
pkgdesc='Injects the mvps blocklist to /etc/hosts to prevent thousands of parasites, hijackers and unwanted adware/spyware/privacy websites from working.'
arch=('any')
depends=('curl')
license=('GPL')
url=("https://github.com/graysky2/hosts-update")
source=("http://repo-ck.com/source/$pkgname/$pkgname-$pkgver.tar.xz")
replaces=('hosts_update')
conflicts=('hosts_update')
backup=('etc/hosts.local')
sha256sums=('5e5e8e7b2e5981fe3ad6b9c94f4a0fd9fd95de8ae6b8b8e7c1b136338c383162')
install=readme.install

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
