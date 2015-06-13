# Contributor: Eric Forgeot < http://anamnese.online.fr >
# Maintainer: SanskritFritz (gmail)

pkgname=pushover
pkgver=0.0.5
pkgrel=1
pkgdesc="Clone of the puzzle game Pushover (Amiga)."
arch=('i686' 'x86_64')
url="http://pushover.sourceforge.net/"
license=('GPL')
depends=('glibc' 'sdl_mixer' 'sdl_ttf' 'lua' )
source=("http://prdownloads.sourceforge.net/pushover/$pkgname-$pkgver.tar.gz"
        "$pkgname.desktop")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix="$pkgdir/usr" install

  install -D -m644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

md5sums=('cb88df3192677543bfc0a0179d176806'
         'c7150a9f3542689ad3056301e9f3e9fd')
