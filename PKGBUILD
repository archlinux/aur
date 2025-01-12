# Maintainer: Werenter <werenter@cock.li>

pkgname=gcli
pkgver=2.6.0
pkgdesc="A CLI for Github, Gitlab and Gitea written in C"
pkgrel=1
arch=('any')
license=('BSD-2-Clause')
url="https://github.com/herrhotzenplotz/gcli"
depends=('curl')
source=("https://herrhotzenplotz.de/gcli/releases/gcli-$pkgver/gcli-$pkgver.tar.bz2")
sha256sums=('70c11a8d3acf7d749952f5654959e980f0236305fd5045b30ec6b5de664f4fe5')

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
