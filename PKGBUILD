# Maintainer: Sebastian LaVine <mail@smlavine.com>

pkgname=gmnitohtml
pkgver=0.1.3
pkgrel=1
pkgdesc='Gemini text to HTML converter'
arch=('any')
url='https://git.sr.ht/~adnano/gmnitohtml'
license=('GPL3')
makedepends=('go' 'scdoc')
source=("https://git.sr.ht/~adnano/gmnitohtml/archive/${pkgver}.tar.gz")
sha256sums=('f1f63eb33b77398d9bb8af0b4d15e61cf02db27472082bc853b1a8d2b75f3c9f')

build() {
	cd "${pkgname}-${pkgver}"
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir/" PREFIX='/usr' install
}
