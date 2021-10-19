# Maintainer: Konrad Sekuła <konradsekula@outlook.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=bruh
pkgver=2.1
pkgrel=1
pkgdesc="bruh sound, but as a program"
arch=('x86_64')
license=('GPL3')
url='https://github.com/kejpies/bruh'
depends=("alsa-utils")
optdepends=("pulseaudio: ALSA alternative")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('f58cc6371d09a0b77f208698b3842b02e41b335c9e620583fe01e37d64b697a2')
build() {
   cd "$pkgname-$pkgver"
   make
}

package() {
   cd "$pkgname-$pkgver"
   make install DESTDIR="$pkgdir" PREFIX=/usr
   install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
