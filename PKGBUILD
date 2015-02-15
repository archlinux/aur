# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=mpdris2
pkgver=0.6
pkgrel=1
pkgdesc="MPRIS2 support for MPD"
url="https://github.com/eonpatapon/mpDris2"
arch=('any')
license=('GPL3')
depends=('python2-dbus' 'python2-gobject' 'python2-mpd')
makedepends=('intltool')
optdepends=(
  'mutagen: read covers from music files'
  'python2-notify: notifications on track change'
)
source=("https://github.com/eonpatapon/mpDris2/archive/${pkgver}.tar.gz")

build() {
  cd "${srcdir}/mpDris2-${pkgver}"
  ./autogen.sh --prefix=/usr --sysconfdir=/etc
  make
  sed -i "1s/python/python2/" "src/mpDris2"
}

package() {
  cd "${srcdir}/mpDris2-${pkgver}"
  make DESTDIR="$pkgdir" install
}

sha256sums=('7feba8f552ced721c7cbd44a828e6a3ffad185479c18a2873719362a6455b57d')
