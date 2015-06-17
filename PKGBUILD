# Maintainer: Ezra Sharp <nicekiwi@gmail.com>

pkgname=ste-plugins
_realpkgname=STE-plugins
pkgver=0.0.2
pkgrel=1
pkgdesc='STE LADSPA plugins package. Includes stereo panner and width adjuster.'
arch=('i686' 'x86_64')
url='http://kokkinizita.linuxaudio.org/linuxaudio/downloads/'
license=('GPL2')
makedepends=('ladspa')
source=("http://kokkinizita.linuxaudio.org/linuxaudio/downloads/$_realpkgname-$pkgver.tar.bz2")
md5sums=('9a6b41cb8594221f7a87cb8662e8699d')

build() {
    cd "$srcdir/$_realpkgname-$pkgver"
    
    sed -i Makefile -e 's/-O2//' -e 's/g++/$(CXX) $(LDFLAGS)/'
    make
}

package() {
    cd "$srcdir/$_realpkgname-$pkgver"
    mkdir -p "$pkgdir/usr/lib/ladspa"
    cp stereo-plugins.so "$pkgdir/usr/lib/ladspa"
}
