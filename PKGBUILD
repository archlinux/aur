# Maintainer: Konrad Sekuła <konradsekula@outlook.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=bruh
pkgver=2.0
pkgrel=1
pkgdesc="bruh sound, but as a program"
arch=('x86_64')
license=('GPL3')
url='https://github.com/kejpies/bruh'
depends=("alsa-utils")
optdepends=("pulseaudio: ALSA alternative")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('f01ff6fffbe657f1ef04c2ef9a5b8da81ad50be481756b569e30232794279171')
build() {
   cd "$pkgname-$pkgver"
   make
}

package() {
   cd "$pkgname-$pkgver"
   make install DESTDIR="$pkgdir" PREFIX=/usr
   install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
