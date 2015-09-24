# Contributor: speps <speps at aur dot archlinux dot org>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=siren
pkgver=0.6
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
md5sums=('cd13e688064c5ac533bda682c1f84731')
sha1sums=('6c3a304e5e9a4816aa2872669335109d018e70f2')
sha256sums=('5ac944e5d2737942afa1270bf66d72d631b896d37b4c084bdd3a766a5e735a14')

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

