# Maintainer: Eugenio M. Vigo <emvigo@gmail.com>

pkgname=minitimer
pkgver=2.0.1
pkgrel=1
pkgdesc='Mini Timer - A timer in your terminal'
arch=('x86_64')
url='https://github.com/emvigo/minitimer'
license=('APACHE')
depends=('glibc')
source=("https://github.com/emvigo/minitimer/archive/$pkgver.tar.gz")
sha256sums=('58bb228b5cfbb75f9962a1a53ee280cddc8f0b60c5f227d5da88c47fad2b375c')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	make DESTDIR="$pkgdir/" PREFIX='/usr' install
}
