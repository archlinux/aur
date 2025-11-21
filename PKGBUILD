# Maintainer: Mark <mark@archlinux.org>
# Contributor: Jaden Peterson <jadenpeterson150@gmail.com>

pkgname=aurvote-utils-git
pkgver=1.1.0.r7.g3e82548
pkgrel=1
pkgdesc='A set of utilities for managing AUR votes'
arch=('any')
url=https://github.com/gwuen/aurvote-utils
provides=('aurvote-utils')
conflicts=('aurvote-utils')
license=('MIT')
depends=('python' 'python-beautifulsoup4' 'python-requests')
makedepends=('git')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd aurvote-utils
	git describe --tags | tail -c +2 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd aurvote-utils
	install -D aur-vote "${pkgdir}/usr/bin/aur-vote"
	install aur-autovote "${pkgdir}/usr/bin/aur-autovote"
}
