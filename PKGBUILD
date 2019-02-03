# Contributor: speps <speps at aur dot archlinux dot org>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=siren
pkgver=0.9
pkgrel=1
pkgdesc="A text-based audio player."
arch=(i686 x86_64)
url="http://www.kariliq.nl/siren/"
license=('custom:ISC')
depends=('ncurses')
makedepends=('libao' 'libpulse' 'libid3tag' 'libmad' 'wavpack')
optdepends=('libao: audio output support'
            'libpulse: pulseaudio support'
            'libid3tag: id3 tags support'
            'libmad: mpeg decoder support'
            'wavpack: wav decoder support')
source=("http://www.kariliq.nl/siren/dist/$pkgname-$pkgver.tar.gz")
md5sums=('49f0cb287cd0302b4adcdbfab183e0c1')
sha1sums=('a43d79bc5c11ff1b38bb106964e0848db9853d7c')
sha256sums=('392c707de8854828ccbcca1e4f3c07e68326f9794edb82235a453ef6ee6c421b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure prefix=/usr mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

