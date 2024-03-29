# Maintainer: Werenter <abelokopytov149@gmail.com>

pkgname=gcli
pkgver=2.3.0
pkgdesc="A CLI for Github, Gitlab and Gitea written in C"
pkgrel=1
arch=('any')
license=('BSD')
url="https://github.com/herrhotzenplotz/gcli"
depends=('curl')
source=("https://herrhotzenplotz.de/gcli/releases/gcli-$pkgver/gcli-$pkgver.tar.bz2")
sha256sums=('bbec06de99f5894c8a4e14faaf8ecbfdcac38d4653b5c9fcf3e0bc9c7863a282')

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
