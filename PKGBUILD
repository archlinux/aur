# Maintainer: Sebastian LaVine <mail@smlavine.com>

pkgname=mdtohtml
pkgver=0.1.3
pkgrel=1
pkgdesc='Markdown to HTML converter'
arch=('any')
url='https://git.sr.ht/~adnano/mdtohtml'
license=('GPL3')
makedepends=('go' 'scdoc')
source=("https://git.sr.ht/~adnano/mdtohtml/archive/${pkgver}.tar.gz")
sha256sums=('934623dbfa717e2605771838b16abb170ddbcf6855c5125549c451e6320e67c2')

build() {
	cd "${pkgname}-${pkgver}"
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir/" PREFIX='/usr' install
}
