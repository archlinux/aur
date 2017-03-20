# Contributor: Vjacheslav Gaevskih <feanor1397@gmail.com>

pkgname=gspectran
pkgver=0.1
pkgrel=1
pkgdesc="Gtk+ audio visualizer for pulseaudio."
arch=('x86_64' 'i686')
url='https://github.com/Feanor1397/gspectran'
license=('GPLv3')
depends=('libpulse'
         'fftw'
         'cairomm'
         'gtkmm3'
         )
makedepends=('cmake')
conflicts=('gspectran')
provides=('gspectran')
source=("https://github.com/Feanor1397/gspectran/archive/${pkgver}.tar.gz")
sha256sums=('9f36149abda871c69c3f3d4c33c8ce2f5f75e96975c00f983a957fb8c4095375')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
