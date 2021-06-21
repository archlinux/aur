# Maintainer: ern <ern8642@gmail.com>
pkgname=qtext
pkgver=0.40
pkgrel=1
pkgdesc="A simple, fast and opensource text editor"
arch=('x86_64')
url="https://github.com/ern126/qtext"
license=('GPL')
depends=('qt5-base')
makedepends=('make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ern126/qtext/archive/v$pkgver.tar.gz")
md5sums=('915a2e174dadeb0e1f91f016eb522ec3')

build() {
	cd "$pkgname-$pkgver"
	qmake
	make
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 qtext  "${pkgdir}/usr/bin/qtext"
	install -Dm644 assets/applications/qtext.desktop "${pkgdir}/usr/share/applications/qtext.desktop"
	install -Dm644 assets/docs/README.md "${pkgdir}/usr/share/doc/qtext/README.md"
	install -Dm644 assets/docs/LICENSE "${pkgdir}/usr/share/doc/qtext/LICENSE"
	install -Dm644 assets/docs/CONTRIBUTING.md "${pkgdir}/usr/share/doc/qtext/CONTRIBUTING.md"
}
