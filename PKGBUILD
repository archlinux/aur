# Maintainer: Oliver Galvin <odg at riseup dot net>

pkgname=snooscraper-git
pkgver=0.1
pkgrel=1
pkgdesc="A small program to scrape subreddits, reddit accounts and other sites, downloading content matching your criteria"
arch=('all')
url="https://notabug.org/odg/snooscraper"
license=('GPL')
depends=('sh' 'curl' 'jq' 'sed' 'grep' 'find')
install=snooscraper-git.install
source=("${pkgname}::git+${url}.git")
sha512sums=('SKIP')
validpgpkeys=('491E0D9EE7AA9E15D089950A787966257046CC21') #Oliver Galvin

package() {
	cd "$pkgname"
	install -m755 snooscraper "${pkgdir}/usr/bin/snooscraper"
	install -dm755 "${pkgdir}/usr/share/snooscraper"
	install -m755 config "${pkgdir}/usr/share/snooscraper"
}

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
