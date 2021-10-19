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
sha256sums=('197f1a9f3b8e24c552f4162ef85319e7b5503017648f2dff7f0d4357d4c7a78f')
build() {
   cd "$pkgname-$pkgver"
   make
}

package() {
   cd "$pkgname-$pkgver"
   make install DESTDIR="$pkgdir" PREFIX=/usr
   install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
