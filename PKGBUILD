# Maintainer: Thomas Weißschuh <aur t-8ch de>

pkgname=mpdris2
pkgver=0.9.1
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
sha256sums=('d0f0467841e7866310cff44a1063334a9c776a64fd594815d926670b765fbee6')

build() {
	cd "${srcdir}/mpDris2-${pkgver}"

	./autogen.sh --prefix=/usr --sysconfdir=/etc
	make
}

package() {
	cd "${srcdir}/mpDris2-${pkgver}"

	make DESTDIR="$pkgdir" install
}
