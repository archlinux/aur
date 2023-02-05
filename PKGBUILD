# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor:  grimi <grimi at poczta dot fm>
# Contributor:  speps <speps at aur dot archlinux dot org>
# Contributor: john_schaf <john_schaf@hotmail.fr>

pkgname=xmp
pkgver=4.1.0
pkgrel=2
pkgdesc="The Extended Module Player is a portable command-line module player that supports over 90 module formats (Amiga, Atari, ..)"
arch=(i686 x86_64)
url="http://xmp.sourceforge.net/"
license=('GPL')
depends=('libxmp>=4.4' 'libpulse')
backup=('etc/xmp/xmp.conf' 'etc/xmp/modules.conf')
source=("http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('1dbd61074783545ac7bef5b5daa772fd2110764cb70f937af8c3fad30f73289e')


build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr \
  --disable-oss \
  --enable-pulseaudio
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

