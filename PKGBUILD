# Contributor: Corentin Rossignon <corentin.rossignon@gmail.com>
pkgname=dns2tcp
pkgver=0.5.2
pkgrel=1
pkgdesc="TCP over DNS."
arch=('i686' 'x86_64' 'armv7h')
url="http://www.hsc.fr/ressources/outils/dns2tcp"
license=('GPL2')
source=(http://www.hsc.fr/ressources/outils/${pkgname}/download/${pkgname}-${pkgver}.tar.gz)
sha256sums=('ea9ef59002b86519a43fca320982ae971e2df54cdc54cdb35562c751704278d9')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	./configure --prefix=/usr
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR="$pkgdir/" install
}

