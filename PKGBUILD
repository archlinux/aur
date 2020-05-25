# Maintainer: Eugenio M. Vigo <emvigo@gmail.com>

pkgname=turbodiary
pkgver=1.0.1
pkgrel=1
pkgdesc='Turbo Diary - A Personal Diary'
arch=('x86_64')
url='https://git.sr.ht/~emvigo/turbodiary'
license=('APACHE')
depends=('glibc')
source=("https://git.sr.ht/~emvigo/turbodiary/archive/$pkgver.tar.gz")
sha256sums=('666c5c25f7e834ffb225976cf4501742b15627cfc2d8b07275f9752f25f24ed1')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	make PREFIX="$pkgdir/usr" install
}
