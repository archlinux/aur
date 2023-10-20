# Maintainer:

_pkgname="mp3guessenc"
pkgname="$_pkgname-beta"
pkgver=0.27.6
_beta="beta"
pkgrel=1
pkgdesc="A program which guesses which MP3 encoder was used to encode a given MP3 file"
arch=('i686' 'x86_64')
url="http://mp3guessenc.sourceforge.net/"
license=('GPL')
depends=('glibc')

provides=("$_pkgname")
conflicts=("$_pkgname")

source=(
  "https://sourceforge.net/projects/mp3guessenc/files/$_pkgname-${pkgver%.*}/$_pkgname-$pkgver$_beta.tar.gz")

sha256sums=('3562d6a0bda623411d2655844dbb55650e9e3d8612dbb02743869ef38cafbe4a')

build() {
  cd "$srcdir/$_pkgname-$pkgver$_beta"
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver$_beta"
  install -Dm755 "$_pkgname" -t "$pkgdir/usr/bin"
}
