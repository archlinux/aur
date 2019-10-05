# Maintainer: hashworks <mail@hashworks.net>

pkgname=dns-zone-blacklist-git
pkgver=r337.01caed5
pkgrel=1
pkgdesc='dnsmasq, bind and unbound zone files to be used in DNS based AD Blockers'
url='https://github.com/oznu/dns-zone-blacklist'
license=('MIT')
arch=('any')
optdepends=('unbound' 'bind' 'dnsmasq')
source=('git+https://github.com/oznu/dns-zone-blacklist.git')
md5sums=('SKIP')

pkgver() {
	cd "dns-zone-blacklist"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	mkdir -p "${pkgdir}/etc/dns-zone-blacklist"
	cd "dns-zone-blacklist"
	cp -r bind dnsmasq unbound "${pkgdir}/etc/dns-zone-blacklist"
}
