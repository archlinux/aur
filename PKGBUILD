# Contributor: graysky <graysky AT archlinux dot us>
pkgname=hosts-update
pkgver=1.36
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
sha256sums=('ae6651a744e4f401f2b9e7a8bb0346d4dde50ece4a148dcb34baf49d9fc5eaa7')
install=readme.install

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
