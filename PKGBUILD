# Maintainer: Sebastian LaVine <mail@smlavine.com>

pkgname=gmnitohtml
pkgver=0.1.2
pkgrel=1
pkgdesc='Gemini text to HTML converter'
arch=('any')
url='https://git.sr.ht/~adnano/gmnitohtml'
license=('GPL3')
makedepends=('go' 'scdoc')
source=("https://git.sr.ht/~adnano/gmnitohtml/archive/${pkgver}.tar.gz")
sha256sums=('ae86594d0c3c0af8cc42ccf23b3463c1c20dd724395815a302699d10b9205d64')

build() {
	cd "${pkgname}-${pkgver}"
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir/" PREFIX='/usr' install
}
