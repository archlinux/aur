# Maintainer: Eugenio M. Vigo <emvigo@gmail.com>

pkgname=turbodiary
pkgver=1.0.0
pkgrel=1
pkgdesc='Turbo Diary - A Personal Diary'
arch=('x86_64')
url='https://git.sr.ht/~emvigo/turbodiary'
license=('APACHE')
depends=('glibc')
source=("https://git.sr.ht/~emvigo/turbodiary/archive/$pkgver.tar.gz")
sha256sums=('6048c057ce18fa850b68b33b1a76096e174cb01b156ff6beab5217e7b3d095ce')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	make PREFIX="$pkgdir/usr" install
}
