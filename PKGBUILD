# Maintainer:  Joost Bremmer <toost.b@gmail.com>
# Contributor: Thomas Weißschuh <thomas t-8ch de>

pkgname=mpdris2-py3
pkgver=0.8
pkgrel=1
pkgdesc="MPRIS2 support for MPD using python 3"
url="https://github.com/eonpatapon/mpDris2"
arch=('any')
license=('GPL3')
depends=('python-dbus'
         'python-mpd2'
         'libnotify'
         'python-gobject')
provides=('mpdris2')
conflicts=('mpdris2')
makedepends=('intltool')
optdepends=(
  'python-mutagen: read covers from music files'
  'python-gobject: Gnome notifications and media keys'
)
source=("https://github.com/eonpatapon/mpDris2/archive/${pkgver}.tar.gz")
sha256sums=('b6b15c1fdddf16a6d74485ad09f56ed353a317e149c37475c00a279186da4391')

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
