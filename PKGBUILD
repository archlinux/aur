# Contributor: graysky <graysky AT archlinux dot us>
pkgname=hosts-update
pkgver=1.37
pkgrel=2
pkgdesc='Injects the mvps blocklist to /etc/hosts to prevent thousands of parasites, hijackers and unwanted adware/spyware/privacy websites from working.'
arch=('any')
depends=('curl')
license=('GPL')
url="https://github.com/graysky2/hosts-update"
source=("http://repo-ck.com/source/$pkgname/$pkgname-$pkgver.tar.xz")
replaces=('hosts_update')
conflicts=('hosts_update')
backup=('etc/hosts.local')
sha256sums=('6159d82faa221085cd516f0e1402b18bee67dab9b1ad55224a51b24cf1c1e842')
install=readme.install

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
