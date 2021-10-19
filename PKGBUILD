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
sha256sums=('3fc159835ee7baac6776bbf946e711bbd0337abd6d7b1a8ad97ca9513ea8e1d4'
            'ecafd2f2d0698deb90c7192a71c83645eb03ca64a4b06a24dc79c93a75fd6d8a')
build() {
   cd "$pkgname-$pkgver"
   make
}

package() {
   cd "$pkgname-$pkgver"
   make install DESTDIR="$pkgdir" PREFIX=/usr
   install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
