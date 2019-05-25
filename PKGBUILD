# Maintainer: Ryan Suchocki <ryan <at> ryansuchocki <dot> co <dot> uk>
pkgname=microscheme
pkgver=0.9.3
pkgrel=3
pkgdesc="A Scheme subset designed for Atmel microcontrollers, especially as found on Arduino boards"
arch=('any')
url="http://microscheme.org"
license=('MIT')
groups=()
depends=('glibc' 'avr-gcc' 'avr-libc' 'avrdude')
makedepends=('xxd')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('https://github.com/ryansuchocki/microscheme/archive/v0.9.3.tar.gz')
noextract=()
md5sums=('d7e4e0e5e0181f3eadceb600e7a710dc')

build() {
  cd "$pkgname-$pkgver"
  make all
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="$pkgdir/usr" install
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
