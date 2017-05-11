# Maintainer:
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Tarinaky <tarinaky@hunity.co.uk>

pkgname=skype-call-recorder
pkgver=0.11
pkgrel=2
pkgdesc="Record Skype calls to MP3, Ogg Vorbis or WAV files"
arch=('i686' 'x86_64')
url="http://atdot.ch/scr/"
license=('GPL')
depends=('qt4' 'libvorbis' 'lame' 'id3lib' 'hicolor-icon-theme')
makedepends=('cmake')
source=($pkgname-$pkgver.tar.gz::https://github.com/jlherren/$pkgname/archive/$pkgver.tar.gz)
sha256sums=('096d2498ce7051d4698d254db0971a424ef92db8eb8d598c57483494062348e3')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
