# Contributor: speps <speps at aur dot archlinux dot org>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=siren
pkgver=0.10
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
md5sums=('97959b9974732e64c7e117de6d2af2d6')
sha1sums=('73f72f266fa8ea2a3e2ba978196926abb99086fe')
sha256sums=('54b6af320e1cf223cf02ca9d56859a4f2f796105cd617efa5f37736a3f9719e4')

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
