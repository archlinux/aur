# Maintainer: Thomas Weißschuh <aur t-8ch de>

pkgname=mpdris2
pkgver=0.10.0
pkgrel=1
pkgdesc="MPRIS2 support for MPD"
url="https://github.com/eonpatapon/mpDris2"
arch=(any)
license=(GPL-3.0-only)
depends=('python-dbus' 'python-gobject' 'python-mpd2' 'python-systemd')
makedepends=('intltool')
optdepends=(
  'python-mutagen: read covers from music files'
  'libnotify: notifications on track change'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/eonpatapon/mpDris2/archive/${pkgver}.tar.gz")
sha256sums=('37aea1eb5beae03f4344593bf3e490cfa78ce8adc0a1882bac403ff3a35c633b')

build() {
	cd "${srcdir}/mpDris2-${pkgver}"

	./autogen.sh --prefix=/usr --sysconfdir=/etc
	make
}

package() {
	cd "${srcdir}/mpDris2-${pkgver}"

	make DESTDIR="$pkgdir" install
}
