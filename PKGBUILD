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
sha256sums=('3a181077b7c869b5fd2e6273bebcc7f666f1fb5a80d23d22d5b909ef813aa6e9')
build() {
   cd "$pkgname-$pkgver"
   make
}

package() {
   cd "$pkgname-$pkgver"
   make install DESTDIR="$pkgdir" PREFIX=/usr
   install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
