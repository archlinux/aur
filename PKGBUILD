# Maintainer: f4iey <f4iey@f6kgl.ampr.org>
pkgname=vlfrx-tools
pkgver=0.9m
pkgrel=2
pkgdesc="A modular software toolkit for timestamped signal processing and storage."
arch=('any')
license=('BSD')
#makedepends=()
depends=('fftw' 'alsa-lib' 'libvorbis' 'flac' 'libjpeg' 'xforms' 'libsamplerate' 'ncurses' 'libx11' 'libpng' 'libxpm' 'libshout' 'sox' 'gnuplot' 'texlive-core')
url="http://abelian.org/vlfrx-tools"
source=("$url/$pkgname-$pkgver.tgz")

sha256sums=('SKIP')

prepare(){
    mkdir -p $srcdir/build
    tar -C $srcdir/build/ -xvf $pkgname-$pkgver.tgz
}

build(){
    cd $srcdir/build/$pkgname-$pkgver
    ./configure --prefix=$pkgdir/usr/local || return 1
    make
}

package() {
    cd $srcdir/build/$pkgname-$pkgver
    install -dm755 $pkgdir/usr/local/bin
    install -dm755 $pkgdir/usr/local/lib
    install -dm755 $pkgdir/usr/local/include
    make install
}

