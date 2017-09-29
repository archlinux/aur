# Maintainer: VVL <me@ivvl.ru>
# Contributor: VVL <me@ivvl.ru>

pkgname=snft-git
_pkgname=snft
pkgver=v1.1.0.r0.g12332f0
pkgrel=1
pkgdesc="Script for simple configuring firewall based on nftables."
arch=(any)
url="https://github.com/vvl-rulez/snft"
license=('MIT')
source=("$_pkgname::git+https://github.com/vvl-rulez/snft.git")
depends=('nftables')
makedepends=('git')
sha256sums=('SKIP')
pkgver() {
	cd "$_pkgname"
        git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
package() {
	cd "$_pkgname"
	install -Dm755 snft "$pkgdir/usr/bin/snft"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
