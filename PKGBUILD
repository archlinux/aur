# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=papirus-nord
pkgver=3.0.0
pkgrel=1
epoch=1
pkgdesc="Custom colors for folder icons for Papirus Icon Theme!"
arch=('any')
url="https://www.pling.com/p/1360398"
license=('GPL2')
depends=('papirus-icon-theme')
optdepends=('papirus-linux-universe: change folder colors')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Adapta-Projects/Papirus-Nord/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c5e6cc1baa05857fe9f209226ee86fb121cf84182f6b74bbb4e4f100b4db2067')

package() {
	cd Papirus-Nord-$pkgver
	for i in 22x22 24x24 32x32 48x48 64x64; do
		install -d "$pkgdir/usr/share/icons/Papirus/${i}/places"
		cp -r Icons/${i}/* "$pkgdir/usr/share/icons/Papirus/${i}/places"
	done
}
