# Contributor: graysky <graysky AT archlinux dot us>
pkgname=hosts-update
pkgver=1.38
pkgrel=1
pkgdesc='Injects the mvps blocklist to /etc/hosts to prevent thousands of parasites, hijackers and unwanted adware/spyware/privacy websites from working.'
arch=('any')
depends=('curl')
license=('GPL')
url="https://github.com/graysky2/hosts-update"
source=("$pkgname-v$pkgver.tar.gz::https://github.com/graysky2/$pkgname/archive/v$pkgver.tar.gz")
replaces=('hosts_update')
conflicts=('hosts_update')
backup=('etc/hosts.local')
sha256sums=('9a0fdb028beaf9fa4c2ec5f1a0030fcfe1a996ea42b874b944ec07885ca0f2ba')
install=readme.install

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
