# Maintainer: Sebastian LaVine <mail@smlavine.com>

pkgname=kiln
pkgver=0.4.0
pkgrel=1
pkgdesc='A simple static site generator'
arch=('any')
url='https://git.sr.ht/~adnano/kiln'
license=('GPL3')
makedepends=('go' 'scdoc')
source=("https://git.sr.ht/~adnano/kiln/archive/${pkgver}.tar.gz")
sha256sums=('6de055814c7f363c2b5e358dcbed4ca010ca2c11c887b7e506f1574b68f1dd88')

build() {
	cd "${pkgname}-${pkgver}"
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir/" PREFIX='/usr' install
}
