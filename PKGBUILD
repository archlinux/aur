# Maintainer: Ankit R Gadiya <arch@argp.in>
# Contributor: Christian Hesse <mail@eworm.de>

pkgname=sent
pkgver=1
pkgrel=2
pkgdesc='Simple plaintext presentation tool'
arch=('i686' 'x86_64')
url='http://tools.suckless.org/sent'
depends=('libxft' 'fontconfig' 'libpng')
optdepends=('farbfeld: Image support')
license=('MIT')
source=(https://git.suckless.org/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.gz
		config.h)
sha256sums=('8d88c1d9b0990871c9b02d762ab4f1596e70e97bf228dab99115894133d999ad'
            '5b93e790d607389a4966595cb32a818f6f076605aff52d9a87f54b4587e4d79e')

prepare() {
	cd $pkgname-$pkgver
	cp "$srcdir"/config.h config.h
}

build() {
	cd $pkgname-$pkgver
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR="${pkgdir}" PREFIX='/usr/' install
}
