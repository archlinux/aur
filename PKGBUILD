# Maintainer: Sebastian LaVine <mail@smlavine.com>

pkgname=kiln
pkgver=0.4.1
pkgrel=1
pkgdesc='A simple static site generator'
arch=('any')
url='https://git.sr.ht/~adnano/kiln'
license=('GPL3')
makedepends=('go' 'scdoc')
source=("https://git.sr.ht/~adnano/kiln/archive/${pkgver}.tar.gz")
sha256sums=('eb8aa77bcd7f741ef2ec6404115fb99d97b2e0f5afb67f36fb2c83c0a2291a53')

build() {
	cd "${pkgname}-${pkgver}"
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir/" PREFIX='/usr' install
}
