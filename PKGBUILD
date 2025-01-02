# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor:  grimi <grimi at poczta dot fm>
# Contributor:  speps <speps at aur dot archlinux dot org>
# Contributor: john_schaf <john_schaf@hotmail.fr>

pkgname=xmp
pkgver=4.2.0
pkgrel=3
pkgdesc="The Extended Module Player is a portable command-line module player that supports over 90 module formats (Amiga, Atari, ..)"
arch=(i686 x86_64)
url="http://xmp.sourceforge.net/"
license=('GPL-2.0-or-later')
depends=('libxmp>=4.6' 'libpulse' 'glibc' 'alsa-lib' 'sndio')
backup=('etc/xmp/xmp.conf' 'etc/xmp/modules.conf')
source=("http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('dc54513af9a4681029a1243fd0c9cdf153d813a1125de6c782926674285bc5ae')


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

