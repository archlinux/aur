# Maintainer: Thomas Weißschuh <thomas_weissschuh lavabit com>

pkgname=mpdris2
pkgver=0.3
pkgrel=1
pkgdesc="MPRIS2 support for MPD"
url="https://github.com/eonpatapon/mpDris2"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('python2-dbus' 'python2-gobject' 'python2-mpd')
makedepends=('intltool')
source=("https://github.com/downloads/eonpatapon/mpDris2/mpDris2-${pkgver}.tar.gz")

build() {
  cd "${srcdir}/mpDris2-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
  sed -i "1s/python/python2/" "src/mpDris2"
}

package() {
  cd "${srcdir}/mpDris2-${pkgver}"
  make DESTDIR="$pkgdir" install
}
sha512sums=('b43f10fcb951bcda1f3b110ec04acbaf53118811855fca9c0b6875f04c30bb42bd6064a32a81c428f90650c2270f1da13cffd379ef5ed1a9c099bfd8f40a8f32')
