# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=afternoonstalker
pkgver=1.2.0
pkgrel=2
pkgdesc="a robot-killing video game. It is a clone of the 1982 Night Stalker video game for the Intellivision"
arch=('x86_64')
url="http://gvlsywt.cluster051.hosting.ovh.net/dev/${pkgname}.html"
license=('GPL-2.0-or-later')
depends=('sdl2' 'sdl2_image' 'sdl2_mixer' 'sdl2_mixer' 'sdl2_gfx' 'libflatzebra')
source=("http://gvlsywt.cluster051.hosting.ovh.net/dev/${pkgname}-${pkgver}.tar.gz")
sha512sums=('9137bd6a6d2bd0a58b40952d149a8e742d575f61393c2e20b6a18f6a9ed74331cbea7a94280d2fa31e9162e7d9a1d1618e38e81f91e618ee074fd6b846fb74a4')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
