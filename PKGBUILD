# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=gnaural
pkgver=1.0.20110606
pkgrel=2
pkgdesc="An opensource binaural-beat generator"
arch=(i686 x86_64)
url="http://gnaural.sourceforge.net/"
license=('GPL')
depends=('libglade' 'portaudio')
conflicts=('gnaural2' 'gnaural-cvs' 'gnaural-bbgen')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/project/$pkgname/Gnaural/$pkgname-$pkgver.tar.gz")
md5sums=('8eea03a78ba02ee5d13c55fc6c0c9a00')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # desktop file path fix
  sed -i "s|gnome/apps/Multimedia|applications|g" Makefile.*

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
