# Maintainer: David Adler <d dot adler at posteo dot de>
pkgname=spectrojack
pkgver=0.4.1
pkgrel=1
pkgdesc="a little spectrogram/audiogram/sonogram/whatever for JACK"
arch=('x86_64')
url="http://sed.free.fr/spectrojack/"
license=('custom')
depends=('jack' 'fftw' 'gtk2')
source=("http://sed.free.fr/spectrojack/$pkgname-$pkgver.tar.gz")
md5sums=('6e46da91d79fd7e3bc555c6a6acd94c7')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 spectrojack_icon.svg $pkgdir/usr/share/spectrojack/icon.svg
  install -Dm644 -t $pkgdir/usr/share/spectrojack/colormaps colormaps/*
  install -d $pkgdir/usr/share/licenses/$pkgname
  echo -e "public domain, see\nhttp://sed.free.fr/\n" > $pkgdir/usr/share/licenses/$pkgname/licence
}

