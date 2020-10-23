# Maintainer: solsTiCe d'Hiver <solstice.dhiver@gmail.com>
pkgname=piavpn-manual-git
_pkgname=piavpn-manual
pkgver=r26.82ebed7
pkgrel=1
pkgdesc="Shell scripts to connect manually to PIA VPN"
arch=(any)
url="https://github.com/pia-foss/manual-connections"
license=('MIT')
depends=(curl jq)
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=(!strip )
source=('git+https://github.com/pia-foss/manual-connections.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/manual-connections"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/manual-connections"
	mkdir -p "$pkgdir/opt/piavpn-manual"
	cp -r * "$pkgdir/opt/piavpn-manual"
}
