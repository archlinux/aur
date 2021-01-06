# Maintainer: zoe <chp321 AT gmail DOT com>
# Contributor: Gadget3000 <Gadget3000@msn.com>
pkgname=mp3check
pkgver=0.8.7
pkgrel=2
pkgdesc="Check mp3 files for consistency plus fix header and id3tag errors"
arch=('i686' 'x86_64' 'armv7h')
url="https://code.google.com/archive/p/${pkgname}/"
license=('GPL')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/${pkgname}/${pkgname}-${pkgver}.tgz")
md5sums=('83f5fd6514a55c88126725275aa2d1d5')
depends=('gcc-libs')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr  
  ADDITIONAL_CPPFLAGS="-fpermissive" make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -D -m755 mp3check ${pkgdir}/usr/bin/mp3check
}
