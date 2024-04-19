# Maintainer: Philipp Micheel <39773919+bbx0@users.noreply.github.com>
# Contributor: Philipp Micheel <39773919+bbx0@users.noreply.github.com>

# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=powertop-to-tmpfile
pkgver=0.1.0
pkgrel=1
pkgdesc='Apply PowerTOP recommendations via a tmpfiles.d configuration file'
url='https://github.com/bbx0/powertop-to-tmpfile'
arch=('any')
license=('GPL-3.0-or-later')
depends=('bash' 'powertop' 'sed')
makedepends=('help2man')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('ba00df43290db2a5519e84815751942d44139041ab4b273a63fc00df8ca5603daa342ce7bc4242257e24ef6f278a2e176368870b61dffd531b30034669799ce1')

build() {
	cd "${pkgname}-${pkgver}"
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR=${pkgdir} PREFIX=/usr install
}
