# Maintainer: Konrad Sekuła <konradsekula@outlook.com>
pkgname=bruh
pkgver=2.0
pkgrel=0
pkgdesc="Bruh sound, but as a program. You can use it to make your software more fun."
arch=('i686' 'x86_64')
license=('GPL')
depends=("alsa-utils")
makedepends=("make" "coreutils" "gcc")
optdepends=("pulseaudio: for pa support if you don't like ALSA")
source=("git+https://github.com/kejpies/bruh")
provides=("bruh")
pkgver(){
  cd "$srcdir/$pkgname"
  cat ver
}
build() {
  cd "$srcdir/$pkgname"
  make
}
package() {
  cd "$srcdir/$pkgname"
  
  install -Dm 755 -o root bruh $pkgdir"/usr/bin/bruh"
  install -Dm 644 -o root bruh.wav $pkgdir"/usr/share/bruh/bruh.wav"
}

md5sums=(SKIP)
