# Maintainer: Robert Scott <rs at robsco dot info>
pkgname=autotalent
pkgver=0.2
pkgrel=1
pkgdesc="A real-time pitch correction LADSPA plugin"
arch=('i686' 'x86_64')
url="http://tombaran.info/autotalent.html"
license=('GPL2')
groups=('multimedia')
depends=('ladspa')
source=("http://tombaran.info/autotalent-0.2.tar.gz")
md5sums=('f59443efc6ce0f4b46be86933db33acd')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make INSTALL_PLUGINS_DIR="$pkgdir/usr/lib/ladspa" install
}
