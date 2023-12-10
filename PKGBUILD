# Maintainer: Werenter <abelokopytov149@gmail.com>

pkgname=gcli
pkgver=2.1.0
pkgdesc="A CLI for Github, Gitlab and Gitea"
pkgrel=1
arch=('any')
license=('BSD')
url="https://www.gnu.org/software/autoconf"
depends=('curl')
source=("https://herrhotzenplotz.de/gcli/releases/gcli-2.1.0/gcli-2.1.0.tar.bz2")
sha256sums=('d38bed9f7d091aa90c932e6a03d68fee28ce6f278f41fc72d61c8afca96dc87a')

build() {
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install

	# license exception
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/gcli/LICENSE
}
