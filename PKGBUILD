# Maintainer: Martin Wagner <martin.wagner.dev@gmail.com>
# Contributor: Martin Wagner <martin.wagner.dev@gmail.com>

pkgname=mpdevil
pkgver=0.8.5
pkgrel=1
pkgdesc="A small MPD client written in python"
arch=('any')
license=('GPL3')
url="https://github.com/SoongNoonien/mpdevil"
depends=('python-mpd2' 'gtk3' 'libnotify' 'python-gobject' 'python-requests' 'python-beautifulsoup4' 'python-dbus')
makedepends=('intltool')
source=("https://github.com/SoongNoonien/mpdevil/archive/v${pkgver}.tar.gz")
sha256sums=('bb0933c52001ec2876c01decb9f0cfaa1567fd311f9f0b1cd641c6c9b39e395a')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr 
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

