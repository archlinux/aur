# Maintainer: Albert Graef <aggraef at gmail dot com>
# Contributor: Bjoern Lindig bjoern dot lindig at googlemail dot com

pkgname=pure-audio
pkgver=0.6
pkgrel=1
pkgdesc="Digital audio interface for Pure"
arch=("i686" "x86_64")
license=('BSD')
url="http://purelang.bitbucket.org/"
depends=('pure' 'portaudio' 'fftw' 'libsndfile' 'libsamplerate')
makedepends=()
groups=(pure-complete pure-multimedia)
source=("https://bitbucket.org/purelang/pure-lang/downloads/$pkgname-$pkgver.tar.gz")
md5sums=('5c061e1b4085321832726a81b400dc4b')

build() {
     cd $srcdir/$pkgname-$pkgver
     export LDFLAGS="$LDFLAGS -Wl,--no-as-needed"

     make 
}

package() {
     cd $srcdir/$pkgname-$pkgver
     make DESTDIR=$pkgdir install
     install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
