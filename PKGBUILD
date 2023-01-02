# Maintainer: Sebastian LaVine <mail@smlavine.com>

pkgname=mdtohtml
pkgver=0.1.2
pkgrel=1
pkgdesc='Markdown to HTML converter'
arch=('any')
url='https://git.sr.ht/~adnano/mdtohtml'
license=('GPL3')
makedepends=('go' 'scdoc')
source=("https://git.sr.ht/~adnano/mdtohtml/archive/${pkgver}.tar.gz")
sha256sums=('f80e3ada4762b9535ee12cd9548d0c30733095b5631a6347f044ed278865384c')

build() {
	cd "${pkgname}-${pkgver}"
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir/" PREFIX='/usr' install
}
