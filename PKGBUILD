# Maintainer: Eugenio M. Vigo <emvigo@gmail.com>
pkgname=turbodiary
pkgver=0.4.0
pkgrel=1
pkgdesc="Turbo Diary - A Personal Diary"
arch=('x86_64')
url="https://github.com/emvigo/turbodiary"
license=('APACHE')
depends=('openssl' 'pcre2')
makedepends=('pkgconf')
source=("https://github.com/emvigo/turbodiary/archive/$pkgver.tar.gz")
sha256sums=('c08ee257aa13c4580b305659b17468e1a8e24da2308f9e30a0860614340c448e')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/bin"
    make DESTDIR="$pkgdir/" PREFIX="/usr" install
}
