# Maintainer:  Joost Bremmer <toost.b@gmail.com>
# Contributor: Thomas Weißschuh <thomas t-8ch de>

pkgname=mpdris2-py3
pkgver=0.7
pkgrel=2
pkgdesc="MPRIS2 support for MPD using python 3"
url="https://github.com/eonpatapon/mpDris2"
arch=('any')
license=('GPL3')
depends=('python-dbus' 'python-mpd2' 'python-gobject')
provides=('mpdris2')
conflicts=('mpdris2')
makedepends=('intltool')
optdepends=(
  'mutagen: read covers from music files'
  'python-gobject: Gnome notifications and media keys' 
)
source=("https://github.com/eonpatapon/mpDris2/archive/${pkgver}.tar.gz")
sha256sums=('41fc24128e13d4d2b58095c8496357079544fb6a52caca234690a6c265e6ba24')

build() {
  cd "${srcdir}/mpDris2-${pkgver}"
  ./autogen.sh --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}/mpDris2-${pkgver}"
  make DESTDIR="$pkgdir" install
}

# vim: set ts=2 sw=2 et:
