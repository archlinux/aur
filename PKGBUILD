# Maintainer: Werenter <werenter@cock.li>

pkgname=gcli
pkgver=2.6.1
pkgdesc="A CLI for Github, Gitlab and Gitea written in C"
pkgrel=1
arch=('any')
license=('BSD-2-Clause')
url="https://github.com/herrhotzenplotz/gcli"
depends=('curl')
source=("https://herrhotzenplotz.de/gcli/releases/gcli-$pkgver/gcli-$pkgver.tar.bz2")
sha256sums=('ea8ab8107d5d1005a45831ec33389462c2b5eb338f5a79f3552e89873a69ccbc')

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
