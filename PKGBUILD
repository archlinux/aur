# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=papirus-nord
pkgver=202008291420
pkgrel=1
pkgdesc="Custom colors for folder icons for Papirus Icon Theme!"
arch=('any')
url="https://www.pling.com/p/1360398"
license=('GPL2')
depends=('papirus-icon-theme')
optdepends=('papirus-linux-universe: change folder colors')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Adapta-Projects/Papirus-Nord/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('63407cee62be9e1ba3a9dde39d4943141dfc855e18c965cf7bf0d70ac2f337e8')

package() {
	cd Papirus-Nord-$pkgver
	for i in 22x22 24x24 32x32 48x48 64x64; do
		install -d "$pkgdir/usr/share/icons/Papirus/${i}/places"
		cp -r Icons/${i}/* "$pkgdir/usr/share/icons/Papirus/${i}/places"
	done
}
