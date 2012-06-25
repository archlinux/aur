# Maintainer: Thomas Weißschuh <thomas_weissschuh lavabit com>

pkgname=mpdris2
pkgver=0.2
pkgrel=1
pkgdesc="MPRIS2 support for MPD"
url="https://github.com/eonpatapon/mpDris2"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('mpd' 'dbus-python' 'python2-gobject' 'python2' 'python-mpd')
makedepends=('intltool')
source=("https://github.com/downloads/eonpatapon/mpDris2/mpDris2-${pkgver}.tar.gz")

build() {
  cd "${srcdir}/mpDris2-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc
  make
  sed -i "1s/python/python2/" "src/mpDris2"
}

package() {
  cd "${srcdir}/mpDris2-${pkgver}"
  make DESTDIR="$pkgdir" install
}
sha512sums=('280f0ae49fac9defc90a5e9a5bec11239464568b01eb97870c97ad1ddc86c4f6ae933d924a0d15000b24cd2988124bbb1ca94e04c4fa6c26b70ef0e2bd3320b3')
