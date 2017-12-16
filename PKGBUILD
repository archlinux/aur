# Contributor: speps <speps at aur dot archlinux dot org>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=siren
pkgver=0.7
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
md5sums=('5820f32955ee97a70866e1832f978c25')
sha1sums=('86db8ee690899474663fca1a590217b89571853a')
sha256sums=('9be67c83c9ef127127ce4645a5919bd3f963e47d3c12492bc8fbc7c1d20b3d3c')

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

